# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "mastercoin-wallet"
  gem.homepage = "http://github.com/maran/mastercoin-wallet"
  gem.license = "CCPL"
  gem.summary = %Q{Wallet implementation for the Mastercoin protocol}
  gem.description = %Q{Mastercoin wallet using QT bindings to create a useful gui wallet}
  gem.email = "maran.hidskes@gmail.com"
  gem.authors = ["Maran"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mastercoin-wallet #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'releasy'
Releasy::Project.new do
  name "Mastercoin Wallet"
  version = File.exist?('VERSION') ? File.read('VERSION') : ""
  verbose # Can be removed if you don't want to see all build messages.
  executable "bin/mastercoin-wallet"
  files ["lib/**/*.*", "bin/*.*", "resources/*.*"]

  exclude_encoding
  # Create a variety of releases, for all platforms.
  add_build :osx_app do
    url "com.maran.mastercoin_wallet"
    wrapper "../wrappers/gosu-mac-wrapper-0.7.47.tar.gz"
    icon "resources/logo.icns"
  end

  add_deploy :local # Only deploy locally.
end
