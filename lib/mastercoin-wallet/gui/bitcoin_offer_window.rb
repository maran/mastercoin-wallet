module MastercoinWallet 
  class BitcoinOfferWindow < Qt::Dialog
    include Bitcoin::Builder
    include MastercoinWallet::Builder

    slots 'send_transaction()'

    def initialize(parent=nil, options)
      super(parent)

      @ui = Ui_BitcoinOffer.new
      @ui.setupUi(self)

      @amount_input = findChild(Qt::LineEdit, "amountInput")
      @password_input = findChild(Qt::LineEdit, "passwordInput")
      @address_input = findChild(Qt::LineEdit, "addressInput")

      @amount_input.text = options[:bitcoin_amount] if options.has_key?(:bitcoin_amount)
      @address_input.text = options[:address] if options.has_key?(:address)

      @submit = findChild(Qt::PushButton, "submit_button")

      @amount_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @amount_input)

      @submit.enabled = true

      connect(@submit, SIGNAL('clicked()'), self, SLOT('send_transaction()'))
    end

    def send_transaction
      @amount = @amount_input.text()
      @receiving_address = @address_input.text()
      @password = @password_input.text()

      unless Bitcoin::valid_address?(@receiving_address)
        Qt::MessageBox.critical(self, tr("Invalid address"),
                                tr("Please fill in a valid Bitcoin/Mastercoin address"))
      end

      unless @receiving_address.empty? || @amount.empty? || @password.empty? 
         create_bitcoin_transaction_for(@amount)
         close()
      else
        Qt::MessageBox.critical(self, tr("Invalid form"),
                                tr("Please fill in all required inputs"))
      end

    end
  end
end
