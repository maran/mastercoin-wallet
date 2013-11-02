module MastercoinWallet 
  class SimpleSendWindow < Qt::Dialog
    include Bitcoin::Builder
    include MastercoinWallet::Builder

    slots 'on_amount_input_textChanged(const QString&)',
          'on_address_input_textChanged(const QString&)',
          'on_password_input_textChanged(const QString&)',
          'send_payment()'

    # TODO: TRY TO REDEEM MULTISIGS
    def initialize(parent=nil)
      super(parent)

      @ui = Ui_SimpleSend.new
      @ui.setupUi(self)

      @amount_input = findChild(Qt::LineEdit, "amount_input")
      @address_input = findChild(Qt::LineEdit, "address_input")

      @submit = findChild(Qt::PushButton, "submit_button")

      @amount_input.validator = Qt::DoubleValidator.new(0.00000001, 10000,8, @amount_input)


      @currency_select = findChild(Qt::ComboBox, "currency_box")
      # Dont allow real coins for now
      #      @currency_select.addItem(tr("Mastercoin"))
      @currency_select.addItem(tr("Test Mastercoin"))

      connect(@submit, SIGNAL('clicked()'), self, SLOT('send_payment()'))
    end

    def on_amount_input_textChanged(amount)
      @amount = amount
      check_valid
    end

    def on_address_input_textChanged(address)
      @receiving_address = address
      check_valid
    end

    def on_password_input_textChanged(password)
      @password = password
      check_valid
    end

    def send_payment
      data_key = Mastercoin::SimpleSend.new(currency_id: 2, amount: @amount.to_f * 1e8).encode_to_compressed_public_key(MastercoinWallet.config.address)
      MastercoinWallet.log.debug("Mastercoin key: #{data_key}")
      create_transaction_with_keys(data_key)
      close()
    end

    def check_valid
      unless Bitcoin::valid_address?(@receiving_address)
        invalid! 
        return
      end

      if @amount.nil?
        invalid! 
        return
      end

      if @password.nil? || (@password && @password.length < 7)
        invalid!
        return
      end

      valid!
    end
    
    def invalid!
      @submit.enabled = false
    end

    def valid!
      @submit.enabled = true
    end
  end
end
