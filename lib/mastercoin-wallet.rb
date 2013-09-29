require 'qt'
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
  autoload :MainWindow, 'mastercoin-wallet/gui/main_window'
  autoload :FirstRunWindow, 'mastercoin-wallet/gui/first_run_window'
  autoload :SimpleSendWindow, 'mastercoin-wallet/gui/simple_send_window'
  autoload :Config, 'mastercoin-wallet/config'
  autoload :Network, 'mastercoin-wallet/network'

  autoload :Ui_FirstRunWindow, 'mastercoin-wallet/gui/ui_first_run'
  autoload :Ui_SimpleSend, 'mastercoin-wallet/gui/ui_simple_send'

  CONFIG_PATH = "#{Dir.home}/.mastercoin-wallet/"
  FILE_PATH   = CONFIG_PATH + "config.json"

  def self.config
    @@config ||= MastercoinWallet::Config.new
  end

  def self.network
    @@network ||= MastercoinWallet::Network.new
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
