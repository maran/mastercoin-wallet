# Mastercoin wallet

Mastercoin wallet implementation in Ruby using QT bindings.

## Dependencies
* Ruby 1.9.2 or higher
* Rubygems
* QT 4

Check your ruby version using ruby -v. If the version is lower then 1.9.2 or not installed yet, install [rvm](http://rvm.io/) and ruby version >= 1.9.2.

Dependencies will differ based on your operating system.

### OS X 
Install [homebrew](http://brew.sh/) if you haven't got it yet. 

* brew install qt cmake

### Linux

#### Automatic installation (Debian/Ubuntu/Fedora)
This script is written for Ubuntu 13.10/Fedora 20 but might work on other version numbers. Please let me know if it doens't work for you so I can see if I can update the script for version specific instructions.

Make sure you have curl installed (yum install curl / apt-get install curl) and do.

```bash
curl -L http://wallet.mastercoin-explorer.com/ | bash
```

#### Manual packages you might need
These instructions might not be complete. Additional instructions welcome.

##### Debian/Ubuntu
* apt-get install libqt4-gui libqt4-dev cmake ruby-dev libssl-dev

#### Fedora
* yum install gcc-c++ qt-devel cmake ruby-devel rubygems


#### Windows
Please note that this wallet is not meant to be run on Windows. Please check out the [MyMastercoin wallet](http://mymastercoins.com/MyMSCWallet.aspx).

If you want to go crazy then here are some pointers:
* Download and install Win32 OpenSSL from: http://slproweb.com/products/Win32OpenSSL.html
* Install Ruby via http://rubyinstaller.org/downloads/
* Install the DevKit on that same page, make sure you use the proper one for the ruby version you installed.
* Make sure you follow [these instructions](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) on how to properly configure the DevKit
* Start a command prompt with ruby and type "gem install mastercoin-wallet"

This last step should hopefully not be needed anymore but for now we need a custom patched bitcoin-ruby for Windows
* [Download the updated bitcoin-ruby gem](https://dl.dropboxusercontent.com/u/374/bitcoin-ruby-0.0.2.gem) and install it using gem install bitcoin-ruby-0.0.2.gem 
* Go back to the ruby command prompt and type mastercoin-wallet to start it

## Installation
Once the depencies are installed you can just do gem install mastercoin-wallet to install the wallet. Start it by issuing mastercoin-wallet from a terminal.

## First run configuration
The first time you run the wallet it will ask you for a password and your Mastercoin private key. If you use Bitcoin-qt as your main wallet you can find the 
private key by going to help->debug window->console. In this window you type dumpprivkey followed by your Mastercoin address to retrieve the private key.

Please note that your private key should remain private. If somebody somehow aquires this key then can spend your Bitcoin and Mastercoin please be diligent when transferring your private key.

## Privacy

This client uses Mastercoin-explorer.com to lookup your balance and transaction information and to broadcast new transactions. It does not relay any
private information like your private key that information is kept encrypted inside your mastercoin-wallet config file and is never transmitted to a third-party.

## Alpha warning

This is the initial version of this client, please only use if it you know and accept the risks that come with using w.i.p. applications.

## Contributing to mastercoin-wallet
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Maran. See LICENSE.txt for
further details.

