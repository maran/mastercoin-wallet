module MastercoinWallet 
  class SimpleSendWindow < Qt::Dialog
    include Bitcoin::Builder

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

      @amount_input.setText("1.337")
      @address_input.setText("1J2svn2GxYx9LPrpCLFikmzn9kkrXBrk8B")
    

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
      @address = address
      check_valid
    end

    def on_password_input_textChanged(password)
      @password = password
      check_valid
    end

    def send_payment
      data_key = Mastercoin::SimpleSend.new(currency_id: 2, amount: @amount.to_f * 1e8).encode_to_compressed_public_key

      fee = BigDecimal.new("0.0001") * 1e8
      tx_amount = BigDecimal.new("0.00006") * 1e8
      mastercoin_tx = (4 * tx_amount) * 1e8

      result = MastercoinWallet.config.spendable_outputs.find{|x| x[:value].to_f > mastercoin_tx}
      if result.is_a?(Array)
        output = result[0]
      else
        output = result
      end

      unless output
          Qt::MessageBox.critical(self, tr("Could not send transaction"),
                                 tr("It appears there are no spendable outputs for this address that are big enough to transmit this transaction. Please consolidate some coins and send them to your Mastercoin address."))
          return
      end

      change_amount = BigDecimal.new(output["value"]) - fee - mastercoin_tx

      tx = MastercoinWallet.config.bitcoin_transactions.find{|x| x["hash"] == output["prev_out"]["hash"]}
      if tx.is_a?(Array)
        tx = tx[0]
      end

      begin
        priv_key = MastercoinWallet.config.get_encrypted_key(:private_key, @password)
      rescue ArgumentError
        Qt::MessageBox.information(self, tr("Could not send payment."),
                                   tr("Could not send payment, wrong password."))
        return
      end
        begin
          key = Bitcoin::Key.from_base58(priv_key)
        rescue ArgumentError
          begin
            key = Bitcoin::Key.new(priv_key)
          rescue ArgumentError
              Qt::MessageBox.information(self, tr("Could not send payment."),
                                         tr("Could not send payment, wrong password."))
            return
          end
        end

        tx = build_tx do |t|
          t.input do |i|
            i.prev_out Bitcoin::Protocol::Tx.from_hash(tx)
            i.prev_out_index output["prev_out"]["n"] 
            i.signature_key key
          end

          # Change address
          t.output do |o|
            o.value change_amount

            o.script do |s|
              s.type :address
              s.recipient MastercoinWallet.config.address
            end
          end

          # Receiving address
          t.output do |o|
            o.value tx_amount

            o.script do |s|
              s.type :address
              s.recipient @address
            end
          end

          # Exodus address
          t.output do |o|
            o.value tx_amount

            o.script do |s|
              s.type :address
              s.recipient Mastercoin::EXODUS_ADDRESS
            end
          end

          # Data address
          t.output do |o|
            o.value (tx_amount) * 2

            o.script do |s|
              s.type :multisig
              s.recipient 1, key.pub_compressed, data_key
            end
          end
        end

        tx = Bitcoin::Protocol::Tx.new( tx.to_payload )

        MastercoinWallet.log.debug("TX Made: #{tx.to_hash}")

        transaction_hash = tx.to_payload.unpack("H*").first

        MastercoinWallet.log.debug("If you want to send it by Bitcoind use this")
        MastercoinWallet.log.debug(transaction_hash)

        remote_transaction = Transaction.new(tx.to_hash["hash"], tx.to_json)
        response = remote_transaction.create!
        if response.parsed_response.keys.include?("error")
          Qt::MessageBox.critical(self, tr("Could not relay transaction"),
                                 tr("The remote server could not transmit your transaction at this moment."))
          return
        else
          Qt::MessageBox.information(self, tr("Transaction send"),
                                 tr("Your transaction has been offered to the relay server, it should show up within 10 minutes."))
        end
        close()
    end

    def check_valid
      unless Bitcoin::valid_address?(@address)
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
