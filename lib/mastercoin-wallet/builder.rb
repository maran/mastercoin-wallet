module MastercoinWallet
  module Builder
    attr_accessor :fee, :tx_amount, :mastercoin_tx, :btc_amount

    def set_fee(force_fee = nil)
      self.fee = force_fee || BigDecimal.new("0.0001")

      if self.fee < 0.0001
        self.fee = BigDecimal.new("0.0001")
      end

      self.tx_amount = BigDecimal.new("0.00006")
      if @receiving_address
        output_counter = 4
      else
        output_counter = 3
      end
      self.mastercoin_tx = (output_counter * tx_amount)
    end

    def create_bitcoin_transaction_for(amount)
      self.btc_amount = BigDecimal.new(amount)
      self.fee = BigDecimal.new("0.0001")
      self.tx_amount = BigDecimal.new("0.00006")

      # TODO REFACTOR AND DRY IT
      valid_output = MastercoinWallet.config.spendable_outputs.find{|x| BigDecimal.new(x[:value]) > (self.fee + self.tx_amount + self.btc_amount)}

      if valid_output.is_a?(Array)
        ouput = valid_output[0]
      else
        output = valid_output
      end

      unless output
          Qt::MessageBox.critical(self, tr("Could not send transaction"),
                                 tr("It appears there are no spendable outputs for this address that are big enough to transmit this transaction. Please consolidate some coins and send them to your Mastercoin address."))
          return
      end

      change_amount = BigDecimal.new(output["value"]) - self.fee - self.btc_amount - self.tx_amount

      tx = MastercoinWallet.config.bitcoin_transactions.find{|x| x["hash"] == output["prev_out"]["hash"]}
      if tx.is_a?(Array)
        tx = tx[0]
      end

      # DRY THIS AS WELL SHOULD BE IS OWN METHOD
      begin
        priv_key = MastercoinWallet.config.get_encrypted_key(:private_key, @password)
      rescue ArgumentError
        Qt::MessageBox.information(self, tr("Could not send payment."),
                                   tr("Could not send payment, wrong password."))
        return
      end
        begin
          key = Bitcoin::Key.from_base58(priv_key)
        rescue ArgumentError, RuntimeError
          begin
            key = Bitcoin::Key.new(priv_key)
          rescue ArgumentError, OpenSSL::BNError, RuntimeError
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
            o.value change_amount * 1e8

            o.script do |s|
              s.type :address
              s.recipient MastercoinWallet.config.address
            end
          end

          # Receiving address
          t.output do |o|
            o.value self.btc_amount * 1e8

            o.script do |s|
              s.type :address
              s.recipient @receiving_address
            end
          end

          # Exodus address
          t.output do |o|
            o.value self.tx_amount * 1e8

            o.script do |s|
              s.type :address
              s.recipient Mastercoin::EXODUS_ADDRESS
            end
          end
        end

        tx = Bitcoin::Protocol::Tx.new( tx.to_payload )

        MastercoinWallet.log.debug("TX Made: #{tx.to_hash}")

        transaction_hash = tx.to_payload.unpack("H*").first

        MastercoinWallet.log.debug("If you want to send it by Bitcoind use this")
        MastercoinWallet.log.debug(transaction_hash)
        MastercoinWallet.log.debug("Required fee: #{tx.calculate_minimum_fee} - Multisig size: #{tx.outputs.last.script.bytesize}")

        remote_transaction = Transaction.new(tx.to_hash["hash"], tx.to_json)
        response = remote_transaction.create!
        if response.parsed_response.keys.include?("error")
          Qt::MessageBox.critical(self, tr("Could not relay transaction"),
                                 tr("The remote server could not transmit your transaction at this moment. #{response.parsed_response}"))
          return
        else
          Qt::MessageBox.information(self, tr("Transaction send"),
                                 tr("Your transaction with hash #{tx.to_hash["hash"]} has been offered to the relay server, it should show up within 10 minutes."))
        end
    end

    def create_transaction_with_keys(data_keys, options = {})
      public_keys = []
      public_keys << data_keys
      public_keys.flatten!

      if options.has_key?(:force_fee)
        self.set_fee(BigDecimal.new(options[:force_fee]))
      else
        self.set_fee
      end

      valid_output = MastercoinWallet.config.spendable_outputs.find{|x| BigDecimal.new(x[:value]) > (self.fee + self.mastercoin_tx)}

      if valid_output.is_a?(Array)
        ouput = valid_output[0]
      else
        output = valid_output
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
        rescue ArgumentError, RuntimeError
          begin
            key = Bitcoin::Key.new(priv_key)
          rescue ArgumentError, OpenSSL::BNError, RuntimeError
              Qt::MessageBox.information(self, tr("Could not send payment."),
                                         tr("Could not send payment, wrong password."))
            return
          end
        end

        begin
          public_keys.insert(0, key.pub_compressed)
        rescue RuntimeError => e
              Qt::MessageBox.information(self, tr("Could not send payment."),
                                         tr("Something went wrong while trying to generate your public key. Please report this: #{e}"))
              return
        end


        tx = build_tx do |t|
          t.input do |i|
            i.prev_out Bitcoin::Protocol::Tx.from_hash(tx)
            i.prev_out_index output["prev_out"]["n"] 
            i.signature_key key
          end

          # Change address
          t.output do |o|
            o.value change_amount * 1e8

            o.script do |s|
              s.type :address
              s.recipient MastercoinWallet.config.address
            end
          end

          if @receiving_address
            # Receiving address
            t.output do |o|
              o.value tx_amount * 1e8

              o.script do |s|
                s.type :address
                s.recipient @receiving_address
              end
            end
          end

          # Exodus address
          t.output do |o|
            o.value tx_amount * 1e8

            o.script do |s|
              s.type :address
              s.recipient Mastercoin::EXODUS_ADDRESS
            end
          end

          # Data address
          t.output do |o|
            o.value (tx_amount) * 1e8 * 2

            o.script do |s|
              s.type :multisig
              s.recipient 1, *public_keys
            end
          end
        end

        tx = Bitcoin::Protocol::Tx.new( tx.to_payload )

        MastercoinWallet.log.debug("TX Made: #{tx.to_hash}")

        transaction_hash = tx.to_payload.unpack("H*").first

        MastercoinWallet.log.debug("If you want to send it by Bitcoind use this")
        MastercoinWallet.log.debug(transaction_hash)
        MastercoinWallet.log.debug("Required fee: #{tx.calculate_minimum_fee} - Multisig size: #{tx.outputs.last.script.bytesize}")

        remote_transaction = Transaction.new(tx.to_hash["hash"], tx.to_json)
        response = remote_transaction.create!
        if response.parsed_response.keys.include?("error")
          Qt::MessageBox.critical(self, tr("Could not relay transaction"),
                                 tr("The remote server could not transmit your transaction at this moment. #{response.parsed_response}"))
          return
        else
          Qt::MessageBox.information(self, tr("Transaction send"),
                                 tr("Your transaction with hash #{tx.to_hash["hash"]} has been offered to the relay server, it should show up within 10 minutes."))
        end
    end

  end
end
