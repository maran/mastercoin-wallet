module MastercoinWallet 
  class SellingOfferWindow < Qt::Dialog
    include Bitcoin::Builder
    include MastercoinWallet::Builder

    slots 'send_transaction()'

    def initialize(parent=nil)
      super(parent)

      @ui = Ui_SellingOffer.new
      @ui.setupUi(self)

      @amount_input = findChild(Qt::LineEdit, "amount_input")
      @btc_input = findChild(Qt::LineEdit, "btc_amount_input")
      @fee_input = findChild(Qt::LineEdit, "fee_input")
      @time_input = findChild(Qt::LineEdit, "time_input")
      @password_input = findChild(Qt::LineEdit, "password_input")

      @submit = findChild(Qt::PushButton, "submit_button")

      @amount_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @amount_input)
      @btc_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @btc_input)
      @fee_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @fee_input)
      @fee_input.text = 0.0001
      @time_input.validator = Qt::DoubleValidator.new(1, 100,1, @time_input)
      @time_input.text = 6


      @currency_select = findChild(Qt::ComboBox, "currency_box")
      #@currency_select.addItem(tr("Mastercoin"))
      @currency_select.addItem(tr("Test Mastercoin"))

      @submit.enabled = true

      connect(@submit, SIGNAL('clicked()'), self, SLOT('send_transaction()'))
    end

    def send_transaction
      @amount = @amount_input.text()
      @btc_amount = @btc_input.text()
      @fee_amount = @fee_input.text()
      @time = @time_input.text()
      @password = @password_input.text()

      if @currency_select.currentText() == "Mastercoin"
        currency_id = 1
      elsif @currency_select.currentText() == "Test Mastercoin"
        currency_id = 2
      else
        raise "How did you get here? ^_^"
      end

      unless @time.empty? || @fee_amount.empty? || @btc_amount.empty? || @amount.empty? || @password.empty?

        data_keys = Mastercoin::SellingOffer.new(currency_id: currency_id, amount: (BigDecimal.new(@amount.to_s) * 1e8).to_i, bitcoin_amount: (@btc_amount.to_f * 1e8).to_i, time_limit: @time.to_i, transaction_fee: (@fee_amount.to_f * 1e8).to_i).encode_to_compressed_public_key(MastercoinWallet.config.address)

        create_transaction_with_keys(data_keys)
        close()
      else
        Qt::MessageBox.critical(self, tr("Invalid form"),
                                tr("Please fill in all required inputs"))
      end

    end
  end
end
