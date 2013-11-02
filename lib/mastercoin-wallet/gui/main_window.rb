module MastercoinWallet 
  class MainWindow < Qt::Dialog
    slots 'new_simple_send()', 'new_selling_offer()'

    def initialize()
      super
      setWindowTitle(tr("Mastercoin wallet - v0.0.1"))

      @rows = []

      createBalanceOverview()

      @recentTransactions = Qt::TreeWidget.new
      @recentTransactions.setColumnCount(2)
      @recentTransactions.setHeaderLabels(["Address", "Amount", "Date", "Currency ID"])

      @recentTransactions.setColumnWidth(0,300)
      @recentTransactions.setColumnWidth(1,50)

      overview = Qt::VBoxLayout.new
      @btc_balance_label = Qt::Label.new(tr("#{MastercoinWallet.config.btc_balance} BTC"))
      overview.addWidget(Qt::Label.new(tr("<h3>Mastercoin wallet</h3>")),0,0)
      overview.addWidget(Qt::Label.new(tr(MastercoinWallet.config.address)),1,0)
      overview.addWidget(@btc_balance_label,1,1)
      
      simple_send = Qt::PushButton.new
      simple_send.setText("New simple send")
      connect(simple_send, SIGNAL('clicked()'), self, SLOT('new_simple_send()'))

      selling_offer = Qt::PushButton.new
      selling_offer.setText("New selling offer")
      connect(selling_offer, SIGNAL('clicked()'), self, SLOT('new_selling_offer()'))

      self.layout = Qt::GridLayout.new do |m|
        m.addWidget(@gridGroupBox, 0, 0)
        m.addLayout(overview, 0, 1)
        m.addWidget(@recentTransactions, 1,0,1, 2)
        m.addWidget(simple_send, 2,1)
        #m.addWidget(selling_offer, 2,0)
      end

      MastercoinWallet.network.add_observer(self, :update)
      MastercoinWallet.network.sync!
    end

    def new_simple_send
      dialog = MastercoinWallet::SimpleSendWindow.new
      dialog.exec
    end

    def new_selling_offer
      dialog = MastercoinWallet::SellingOfferWindow.new
      dialog.exec
    end

    def update(status = true)
      load_transactions
      update_balance
    end

    def coin_name(currency_id)
      if currency_id.to_s == "1"
        "MSC"
      else
        "Test MSC"
      end
    end

    def load_transactions
      if MastercoinWallet.config.has_key?(:received_transactions)
        MastercoinWallet.config.received_transactions.each do |x|
          row = Qt::TreeWidgetItem.new
          row.setText(0, x["address"])
          row.setText(1, x["amount"])
          row.setText(2, x["tx_date"])
          row.setText(3, coin_name(x["currency_id"]))
          @rows << row
        end
      end

      if MastercoinWallet.config.has_key?(:exodus_transactions)
        MastercoinWallet.config.exodus_transactions.each do |x|
          row = Qt::TreeWidgetItem.new
          row.setText(0, x["address"])
          row.setText(1, x["amount"])
          row.setText(2, x["tx_date"])
          row.setText(3,coin_name(x["currency_id"]))
          @rows << row
        end
      end

      if MastercoinWallet.config.has_key?(:sent_transactions)
        MastercoinWallet.config.sent_transactions.each do |x|
          row = Qt::TreeWidgetItem.new
          row.setText(0, x["receiving_address"])
          row.setText(1, x["amount"])
          row.setText(2, x["tx_date"])
          row.setText(3,coin_name(x["currency_id"]))
          @rows << row
        end
      end
      @recentTransactions.insertTopLevelItems(0, @rows)
    end

    def update_balance
      @balance_label.setText("#{MastercoinWallet.config.balance} MSC")
      @test_balance_label.setText("Test #{MastercoinWallet.config.test_balance} MSC")
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
