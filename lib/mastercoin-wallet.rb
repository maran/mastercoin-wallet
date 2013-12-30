require 'thread'
require 'Qt'
require 'httparty'
require 'qtuitools'
require 'openssl'
require 'digest/sha2'
require 'fileutils'
require 'json'
require 'mastercoin-ruby'
require 'active_support/core_ext/hash/indifferent_access'
require 'bitcoin'
require 'observer'

module MastercoinWallet
  require 'mastercoin-wallet/gui/images'

  autoload :Address, 'mastercoin-wallet/models/address'
  autoload :Transaction, 'mastercoin-wallet/models/transaction'
  autoload :Util, 'mastercoin-wallet/util'

  autoload :MainWindow, 'mastercoin-wallet/gui/main_window'
  autoload :FirstRunWindow, 'mastercoin-wallet/gui/first_run_window'
  autoload :SimpleSendWindow, 'mastercoin-wallet/gui/simple_send_window'
  autoload :SellingOfferWindow, 'mastercoin-wallet/gui/selling_offer_window'
  autoload :PurchaseOfferWindow, 'mastercoin-wallet/gui/purchase_offer_window'
  autoload :BitcoinOfferWindow, 'mastercoin-wallet/gui/bitcoin_offer_window'
  autoload :Config, 'mastercoin-wallet/config'

  module Models
    autoload :SellingOffer, 'mastercoin-wallet/models/selling_offer'
  end

  module Network
    autoload :Wallet, 'mastercoin-wallet/network/wallet'
    autoload :SellingOffer, 'mastercoin-wallet/network/selling_offer'
  end

  autoload :Builder, 'mastercoin-wallet/builder'

  autoload :Ui_FirstRunWindow, 'mastercoin-wallet/gui/ui_first_run'
  autoload :Ui_SimpleSend, 'mastercoin-wallet/gui/ui_simple_send'
  autoload :Ui_SellingOffer, 'mastercoin-wallet/gui/ui_selling_offer'
  autoload :Ui_PurchaseOffer, 'mastercoin-wallet/gui/ui_purchase_offer'
  autoload :Ui_BitcoinOffer, 'mastercoin-wallet/gui/ui_bitcoin_offer'
  autoload :Ui_MainWindow, 'mastercoin-wallet/gui/ui_main'

  CONFIG_PATH = "#{Dir.home}/.mastercoin-wallet/"
  FILE_PATH   = CONFIG_PATH + "config.json"

  def self.config
    @@config ||= MastercoinWallet::Config.new
  end

  def self.selling_offers
    @@selling_offers ||= MastercoinWallet::Network::SellingOffer.new
  end

  def self.wallet
    @@wallet ||= MastercoinWallet::Network::Wallet.new
  end

  def self.init_logger(level = Logger::DEBUG)
    @@log ||= Logger.new(CONFIG_PATH + "/debug.log")
    @@log.level = level
    @@log
  end

  def self.log
    @@log ||= MastercoinWallet.init_logger
  end
end
