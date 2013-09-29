module MastercoinWallet
  class Address
    include HTTParty
    base_uri 'mastercoin-explorer.com/api/v1/'

    attr_accessor :address

    def initialize(address)
      self.address = address
    end

    def find
      self.class.get("/addresses/#{self.address}/unspent.json")
    end
  end
end
