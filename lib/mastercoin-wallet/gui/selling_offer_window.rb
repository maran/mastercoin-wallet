module MastercoinWallet 
  class SellingOfferWindow < Qt::Dialog
    include Bitcoin::Builder
    slots 'send_payment()'

    def initialize(parent=nil)
      super(parent)

      @ui = Ui_SellingOffer.new
      @ui.setupUi(self)

      @amount_input = findChild(Qt::LineEdit, "amount_input")
      @btc_input = findChild(Qt::LineEdit, "btc_amount_input")
      @fee_input = findChild(Qt::LineEdit, "fee_input")
      @time_input = findChild(Qt::LineEdit, "time_input")

      @submit = findChild(Qt::PushButton, "submit_button")

      @amount_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @amount_input)
      @btc_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @btc_input)
      @fee_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @fee_input)
      @time_input.validator = Qt::DoubleValidator.new(1, 100,1, @time_input)


      @currency_select = findChild(Qt::ComboBox, "currency_box")
      # Dont allow real coins for now
      #      @currency_select.addItem(tr("Mastercoin"))
      @currency_select.addItem(tr("Test Mastercoin"))

      connect(@submit, SIGNAL('clicked()'), self, SLOT('send_payment()'))
    end

    def send_transaction
    end
  end
end
