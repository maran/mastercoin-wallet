module MastercoinWallet
  module Models
    class SellingOffer
      include HTTParty
      base_uri 'mastercoin-explorer.com/api/v1/selling_offers'

      attr_accessor :address

      def all
        self.class.get(".json")
      end

      def current
        self.class.get("/current.json")
      end
    end
  end
end
