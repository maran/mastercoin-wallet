module MastercoinWallet
  class Transaction
    include HTTParty
    base_uri 'mastercoin-explorer.com/api/v1/'

    attr_accessor :hash, :json_payload

    def initialize(hash, json_payload)
      self.hash = hash
      self.json_payload = json_payload
    end

    def create!
      self.class.post("/transactions.json", body: {transaction: {tx_hash: self.hash, json_payload: json_payload}})
    end
  end
end
