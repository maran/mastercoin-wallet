module MastercoinWallet 
  class FirstRunWindow < Qt::Dialog
    slots 'on_password_input_textChanged(const QString&)',
          'on_repeat_password_input_textChanged(const QString&)',
          'on_private_key_input_textChanged(const QString&)',
          'create_and_save_config()'

    def initialize(parent=nil)
      super(parent)
      setWindowTitle(tr("Mastercoin wallet - First run"))

      @ui = Ui_FirstRunWindow.new
      @ui.setupUi(self)

      @password_input = findChild(Qt::LineEdit, "password_input")
      @password_confirmation_input = findChild(Qt::LineEdit, "repeat_password_input")
      @private_key = findChild(Qt::LineEdit, "private_key_input")
      @submit = findChild(Qt::PushButton, "submit_button")
      @error_label = findChild(Qt::Label, "fault")
      @address_label = findChild(Qt::Label, "address")

      connect(@submit, SIGNAL('clicked()'), self, SLOT('create_and_save_config()'))

    end

    def create_and_save_config
      MastercoinWallet.config.set_encrypted_key(:private_key, @priv_key, @password)
      MastercoinWallet.config.set_key(:address, @address)
      MastercoinWallet.config.save

      Qt::MessageBox.information(self, tr("First run complete"),
                                 tr("Congratulations you have now setup your wallet. The application will now shut down please reboot to make use of your Mastercoin wallet."))
      $qApp.quit()
    end

    def check_valid
      valid = true

      unless @password_confirmation == @password
        @error_label.setText("Password does not match confirmation.") 
        invalid!
        return
      else
        @error_label.setText("Password matches confirmation.") 
      end

      if @password.length < 8
        @error_label.setText("Please use at least 8 characters for your password.")
        invalid!
        return
      end

      unless @priv_key
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

    def on_password_input_textChanged(text)
      @password = text
      check_valid
    end

    def on_repeat_password_input_textChanged(text)
      @password_confirmation = text
      check_valid
    end

    def on_private_key_input_textChanged(text)
      @priv_key = text
      begin
        @address = Bitcoin::Key.from_base58(@priv_key).addr
        @address_label.setText("Address for private key: #{@address}")
        check_valid
      rescue RuntimeError
        @address = nil
        @address_label.setText("Cannot get Bitcoin address from private key.")
        invalid!
      end
    end
  end
end
