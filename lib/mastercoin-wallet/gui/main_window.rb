module MastercoinWallet 
  class MainWindow < Qt::Dialog
    include MastercoinWallet::Util

    slots 'new_simple_send()', 'new_selling_offer()', 'new_purchase_offer()', 'create_order(QTreeWidgetItem *, int)', 'sync()', 'create_bitcoin_tx(QTreeWidgetItem *, int)'

    def create_order(item, position)
      address = item.text(0)
      available = item.text(2)
      fee = item.text(4)
      new_purchase_offer({address: address, available: available, fee: fee})
    end

    def create_bitcoin_tx(item, position)
      address = item.text(0)
      bitcoin_amount = item.text(2)
      if item.text(4) == "Waiting on Payment"
        new_bitcoin_payment({address: address, bitcoin_amount: bitcoin_amount})
      else
        Qt::MessageBox.critical(self, tr("Invalid offer"),
                                tr("You can't pay for this offer, either because it's not accepted yet or because it's expired."))
      end
    end

    def initialize()
      super
  
      @ui = Ui_MainWindow.new
      @ui.setupUi(self)

      setWindowTitle(tr("Mastercoin wallet - v0.0.7"))

      @rows = []

      @recentTransactions = findChild(Qt::TreeWidget, "overviewTree")
      @recentTransactions.setColumnWidth(0,300)
      @recentTransactions.hideColumn(5)
      @recentTransactions.setColumnWidth(1,50)
      @recentTransactions.sortByColumn(5)

      @order_book =  findChild(Qt::TreeWidget, "orderTree")
      @order_book.setColumnWidth(0,280)
      @order_book.setColumnWidth(1,70)
      @order_book.setColumnWidth(2,80)
      @order_book.setColumnWidth(4,70)
      @order_book.sortByColumn(3,0)

      connect(@order_book, SIGNAL('itemDoubleClicked(QTreeWidgetItem *, int)'), self, SLOT('create_order(QTreeWidgetItem *,int)'))

      @purchase_offers =  findChild(Qt::TreeWidget, "purchaseTree")
      @purchase_offers.setColumnWidth(0,280)
      @purchase_offers.setColumnWidth(1,70)
      @purchase_offers.setColumnWidth(2,80)
      @purchase_offers.setColumnWidth(4,100)
      @purchase_offers.sortByColumn(5)

      connect(@purchase_offers, SIGNAL('itemDoubleClicked(QTreeWidgetItem *, int)'), self, SLOT('create_bitcoin_tx(QTreeWidgetItem *,int)'))

      @balance_label = findChild(Qt::Label, "mscBalanceLabel")
      @test_balance_label = findChild(Qt::Label, "tMscBalanceLabel")
      @btc_balance_label = findChild(Qt::Label, "bitcoinLabel")
      @address_label = findChild(Qt::Label, "mscAddressLabel")
      @address_label.text = MastercoinWallet.config.address
      
      simple_send = findChild(Qt::PushButton, "simpleSendButton")
      simple_send.setText("New simple send")
      connect(simple_send, SIGNAL('clicked()'), self, SLOT('new_simple_send()'))

      selling_offer = findChild(Qt::PushButton, "sellingButton")
      connect(selling_offer, SIGNAL('clicked()'), self, SLOT('new_selling_offer()'))

      purchase_offer = findChild(Qt::PushButton, "purchaseButton")
      connect(purchase_offer, SIGNAL('clicked()'), self, SLOT('new_purchase_offer()'))

      self.update
      MastercoinWallet.selling_offers.add_observer(self, :update_order_book)
      MastercoinWallet.wallet.add_observer(self, :update)
      self.sync

      # Sync every 30 seconds
      @timer = Qt::Timer.new(self)
      connect(@timer, SIGNAL('timeout()'), self, SLOT('sync()'))
      @timer.start(30000)
    end

    def sync
      MastercoinWallet.selling_offers.retrieve!
      MastercoinWallet.wallet.sync!
    end
    
    def new_bitcoin_payment(options = {})
      dialog = MastercoinWallet::BitcoinOfferWindow.new(nil, options)
      dialog.exec
    end

    def new_simple_send
      dialog = MastercoinWallet::SimpleSendWindow.new
      dialog.exec
    end

    def new_selling_offer
      dialog = MastercoinWallet::SellingOfferWindow.new
      dialog.exec
    end

    def new_purchase_offer(options = {})
      dialog = MastercoinWallet::PurchaseOfferWindow.new(nil, options)
      dialog.exec
    end

    def update(status = true)
      load_transactions
      update_balance
    end

    def add_row(item, type)
      row = Qt::TreeWidgetItem.new
      if type == "Sent"
        row.setText(0, item["receiving_address"])
      else
        row.setText(0, item["address"])
      end
      row.setText(1, item["amount"])
      row.setText(2, type)
      row.setText(3, coin_name(item["currency_id"]))
      row.setText(4, ("%s" % get_date(item["tx_date"])))
      row.setText(5, item["block_height"].to_s)
      return row
    end

    def add_offer_row(item)
      row = Qt::TreeWidgetItem.new
      row.setText(0, item["address"])
      row.setText(1, coin_name(item["currency_id"]))
      row.setText(2, item["amount_available"])
      row.setText(3, "#{item["price_per_coin"]} BTC")
      row.setText(4, item["required_fee"])
      row.setText(5, get_date(item["tx_date"]))
      return row
    end

    def add_purchase_row(item)
      row = Qt::TreeWidgetItem.new
      row.setText(0, item["selling_offer"]["address"])
      row.setText(1, item["accepted_amount"])
      row.setText(2, item["bitcoins_required"])
      row.setText(3, coin_name(item["currency_id"]))
      row.setText(4, item["status_text"])
      row.setText(5, get_date(item["tx_date"]))
      return row
    end

    def update_order_book(orders)
      orders.each do |order|
        @rows << add_offer_row(order)
      end
      @order_book.clear()
      @order_book.insertTopLevelItems(0, @rows)
    end

    def load_transactions
      if MastercoinWallet.config.has_key?(:pending_offers)
        MastercoinWallet.config.pending_offers.each do |x|
          @rows << add_purchase_row(x)
        end
        @purchase_offers.clear()
        @purchase_offers.insertTopLevelItems(0, @rows)
      end

      if MastercoinWallet.config.has_key?(:received_transactions)
        MastercoinWallet.config.received_transactions.each do |x|
          @rows << add_row(x, "Receiving")
        end
      end

      if MastercoinWallet.config.has_key?(:exodus_transactions)
        MastercoinWallet.config.exodus_transactions.each do |x|
          @rows << add_row(x, "Exodus")
        end
      end

      if MastercoinWallet.config.has_key?(:sent_transactions)
        MastercoinWallet.config.sent_transactions.each do |x|
          @rows << add_row(x, "Sent")
        end
      end
      if MastercoinWallet.config.has_key?(:bought)
        MastercoinWallet.config.bought_transactions.each do |x|
          @rows << add_row(x, "Bought")
        end
      end
      if MastercoinWallet.config.has_key?(:sold)
        MastercoinWallet.config.sold_transactions.each do |x|
          @rows << add_row(x, "Sold")
        end
      end
      @recentTransactions.clear()
      @recentTransactions.insertTopLevelItems(0, @rows)
    end

    def update_balance
      @balance_label.setText("#{MastercoinWallet.config.balance} MSC")
      @test_balance_label.setText("#{MastercoinWallet.config.test_balance} Test MSC")
      @btc_balance_label.setText(tr("#{MastercoinWallet.config.btc_balance} BTC"))
    end


    def createBalanceOverview()
        @gridGroupBox = Qt::GroupBox.new(tr("Balances"))
        layout = Qt::GridLayout.new
        @balance_label = Qt::Label.new(tr("Retrieving balance"))
        @test_balance_label = Qt::Label.new(tr("Retrieving test balance"))
        layout.addWidget(@balance_label,1,0)
        layout.addWidget(@test_balance_label,2,0)

        layout.setColumnStretch(1, 10)
        layout.setColumnStretch(2, 20)
        @gridGroupBox.layout = layout
    end
  end
end
