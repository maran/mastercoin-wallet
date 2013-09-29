module MastercoinWallet
  class Config
    attr_accessor :options
    DEFAULT = ActiveSupport::HashWithIndifferentAccess.new(balance: 0, test_balance: 0, spendable_outputs: [], bitcoin_transactions: [], exodus_transactions: [], sent_transactions: [], received_transactions: [], btc_balance: 0)

    def initialize
      self.ensure_config!

      config = File.open(MastercoinWallet::FILE_PATH).read()

      if config.empty?
        self.options = DEFAULT
      else
        self.options = ActiveSupport::HashWithIndifferentAccess.new(JSON.load(config))
      end
    end

    def method_missing(method, *args)
      if self.options.has_key?(method)
        self.get_key(method)
      else
        super(method, args)
      end
    end

    def get_encrypted_key(key, password)
      aes = OpenSSL::Cipher.new("AES-256-CFB") 
      digest_key = Digest::SHA2.hexdigest(password)
      aes.key = digest_key

      begin
        aes.update(self.get_key(key).unpack('m')[0])
      rescue ArgumentError
      end
    end

    def set_encrypted_key(key, value, password)
      aes = OpenSSL::Cipher.new("AES-256-CFB") 
      digest_key = Digest::SHA2.hexdigest(password)

      aes.encrypt
      aes.key = digest_key

      encrypted_value = [aes.update(value)].pack('m')

      set_key(key, encrypted_value)
    end

    def set_keys!(options = {})
      self.options.merge!(options)
      self.save
    end

    def set_key!(key, value)
      set_key(key, value)
      self.save
    end

    def set_key(key, value)
      self.options[key] = value
    end

    def get_key(key)
      return self.options[key] if has_key?(key)
    end

    def has_key?(key)
      self.options.has_key?(key)
    end

    def save
      config = File.open(MastercoinWallet::FILE_PATH, "w")
      config.write( JSON.dump(self.options) )
      config.close
    end

    def has_options?
      !self.options.empty?
    end

    protected
    def ensure_config!
      unless Dir.exists?(MastercoinWallet::CONFIG_PATH)
        FileUtils.mkdir_p(MastercoinWallet::CONFIG_PATH)
      end

      unless File.exists?(MastercoinWallet::FILE_PATH)
        FileUtils.touch(MastercoinWallet::FILE_PATH)
      end
    end
  end
end
