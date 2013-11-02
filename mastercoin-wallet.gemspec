# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mastercoin-wallet"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Maran"]
  s.date = "2013-11-02"
  s.description = "Mastercoin wallet using QT bindings to create a useful gui wallet"
  s.email = "maran.hidskes@gmail.com"
  s.executables = ["mastercoin-wallet"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "Makefile",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/mastercoin-wallet",
    "lib/.DS_Store",
    "lib/mastercoin-wallet.rb",
    "lib/mastercoin-wallet/config.rb",
    "lib/mastercoin-wallet/gui/first_run_window.rb",
    "lib/mastercoin-wallet/gui/first_run_window.ui",
    "lib/mastercoin-wallet/gui/images.rb",
    "lib/mastercoin-wallet/gui/main_window.rb",
    "lib/mastercoin-wallet/gui/selling_offer_window.rb",
    "lib/mastercoin-wallet/gui/selling_offer_window.ui",
    "lib/mastercoin-wallet/gui/simple_send_window.rb",
    "lib/mastercoin-wallet/gui/simple_send_window.ui",
    "lib/mastercoin-wallet/gui/ui_first_run.rb",
    "lib/mastercoin-wallet/gui/ui_selling_offer.rb",
    "lib/mastercoin-wallet/gui/ui_simple_send.rb",
    "lib/mastercoin-wallet/models/address.rb",
    "lib/mastercoin-wallet/models/transaction.rb",
    "lib/mastercoin-wallet/network.rb",
    "mastercoin-wallet.gemspec",
    "resources/images.qrc",
    "resources/logo.svg",
    "test/helper.rb",
    "test/test_mastercoin-wallet.rb"
  ]
  s.homepage = "http://github.com/maran/mastercoin-wallet"
  s.licenses = ["CCPL"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Wallet implementation for the Mastercoin protocol"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<qtbindings>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<active_support>, [">= 0"])
      s.add_runtime_dependency(%q<bitcoin-ruby>, ["~> 0.0.1"])
      s.add_runtime_dependency(%q<mastercoin-ruby>, ["= 0.0.4"])
      s.add_runtime_dependency(%q<ffi>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
    else
      s.add_dependency(%q<qtbindings>, [">= 0"])
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<active_support>, [">= 0"])
      s.add_dependency(%q<bitcoin-ruby>, ["~> 0.0.1"])
      s.add_dependency(%q<mastercoin-ruby>, ["= 0.0.4"])
      s.add_dependency(%q<ffi>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    end
  else
    s.add_dependency(%q<qtbindings>, [">= 0"])
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<active_support>, [">= 0"])
    s.add_dependency(%q<bitcoin-ruby>, ["~> 0.0.1"])
    s.add_dependency(%q<mastercoin-ruby>, ["= 0.0.4"])
    s.add_dependency(%q<ffi>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
  end
end
