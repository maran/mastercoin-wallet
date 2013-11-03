module MastercoinWallet
  module Network
    class SellingOffer
      include Observable

      def retrieve!
        #Thread.new do 
          @selling_offers = MastercoinWallet::Models::SellingOffer.new.current
          self.changed(true)
          notify_observers(@selling_offers)
        #end.join
      end
    end
  end
end
