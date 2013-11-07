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

        transmit!(tx)
    end

    def pick_outputs(required_amount)
      used_outputs = MastercoinWallet.config.created_transactions.collect{|x| x["in"][0]["prev_out"] }
      usuable_outputs = MastercoinWallet.config.spendable_outputs.find{|x| BigDecimal.new(x[:value]) > BigDecimal.new(required_amount.to_s) }

      #puts "Found these total: #{usuable_outputs}"
      #puts "These are used #{used_outputs}"

      usuable_outputs = [usuable_outputs] if usuable_outputs.is_a?(Hash)
      usuable_outputs.reject!{|x| puts x; used_outputs.include?(x["prev_out"])}
      #puts "Left with these: #{usuable_outputs}"

      if usuable_outputs.empty?
        # Outputs are saved in order so the last output should always the one that's unused, make sure it's an output for thist address and that it's big enough
        if MastercoinWallet.config.created_transactions.last["out"].first["address"] == MastercoinWallet.config.address && MastercoinWallet.config.created_transactions.last["out"].first["value"].to_f >= BigDecimal.new(required_amount)
          # We are taking an full transaction and building a spendable output based on the details we have
          output = MastercoinWallet.config.created_transactions.last["out"].first.reverse_merge({prev_out: {hash: MastercoinWallet.config.created_transactions.last["hash"], n: 0}})
          tx = MastercoinWallet.config.created_transactions.last
          return output,tx
        else
          return nil, nil
        end
      else
        if usuable_outputs.is_a?(Array)
          usuable_outputs = usuable_outputs[0]
        end

        tx = MastercoinWallet.config.bitcoin_transactions.find{|x| x["hash"] == usuable_outputs["prev_out"]["hash"]}
        if tx.is_a?(Array)
          tx = tx[0]
        end
        return usuable_outputs, tx
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

      required_amount = (self.fee + self.mastercoin_tx)
      output, tx = pick_outputs(required_amount)

#      puts "Using output: #{output} and Tx: #{tx}"

      unless output
          Qt::MessageBox.critical(self, tr("Could not send transaction"),
                                 tr("It appears there are no spendable outputs for this address that are big enough to transmit this transaction. Please consolidate some coins and send them to your Mastercoin address."))
          return
      end

      change_amount = BigDecimal.new(output["value"]) - fee - mastercoin_tx


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
        transmit!(tx)
    end

    def transmit!(tx)
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
          sent_transactions = MastercoinWallet.config.get_key("created_transactions")
          sent_transactions ||= []
          sent_transactions << tx.to_hash(with_address: true)

          #transactions = MastercoinWallet.config.get_key("bitcoin_transactions")
          #transactions ||= []
          #transactions << tx
          #transactions = MastercoinWallet.config.set_key!("bitcoin_transactions", transactions)


          MastercoinWallet.config.set_key!(:created_transactions, sent_transactions)

          Qt::MessageBox.information(self, tr("Transaction send"),
                                 tr("Your transaction with hash #{tx.to_hash["hash"]} has been offered to the relay server, it should show up within 10 minutes."))
        end
    end

  end
end
