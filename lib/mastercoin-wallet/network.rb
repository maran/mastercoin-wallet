module MastercoinWallet
  class Network
    include Observable

    def initialize
       @mutex = Mutex.new
    end

    def sync!
      Thread.new do 
        @address = Address.new(MastercoinWallet::config.address).find

        MastercoinWallet.config.set_key(:balance, (@address["balance"] || 0))
        MastercoinWallet.config.set_key(:test_balance, (@address["test_balance"] || 0))

        ["sold", "bought", "received_transactions", "sent_transactions", "exodus_transactions", "bitcoin_transactions", "spendable_outputs"].each do |x|
          if @address[x]
            MastercoinWallet.config.set_key(x, @address[x])
          end
        end

        if @address["spendable_outputs"]
          MastercoinWallet.config.set_key(:btc_balance, "%.8f" % MastercoinWallet.config.spendable_outputs.inject(0){|sum, x| sum += x["value"].to_f})
        end

        self.changed(true)

        MastercoinWallet.config.save

        notify_observers(true)
      end
    end
  end
end
