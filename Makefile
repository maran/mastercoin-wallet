all: lib/mastercoin-wallet/gui/ui_purchase_offer.rb lib/mastercoin-wallet/gui/ui_selling_offer.rb lib/mastercoin-wallet/gui/ui_simple_send.rb lib/mastercoin-wallet/gui/ui_first_run.rb lib/mastercoin-wallet/gui/images.rb

lib/mastercoin-wallet/gui/ui_simple_send.rb: lib/mastercoin-wallet/gui/simple_send_window.ui
		rbuic4 lib/mastercoin-wallet/gui/simple_send_window.ui -o lib/mastercoin-wallet/gui/ui_simple_send.rb

lib/mastercoin-wallet/gui/ui_selling_offer.rb: lib/mastercoin-wallet/gui/selling_offer_window.ui
		rbuic4 lib/mastercoin-wallet/gui/selling_offer_window.ui -o lib/mastercoin-wallet/gui/ui_selling_offer.rb

lib/mastercoin-wallet/gui/ui_purchase_offer.rb: lib/mastercoin-wallet/gui/purchase_offer_window.ui
		rbuic4 lib/mastercoin-wallet/gui/purchase_offer_window.ui -o lib/mastercoin-wallet/gui/ui_purchase_offer.rb

lib/mastercoin-wallet/gui/ui_first_run.rb: lib/mastercoin-wallet/gui/first_run_window.ui
		rbuic4 first_run_window.ui -o ui_first_run.rb

lib/mastercoin-wallet/gui/images.rb: resources/images.qrc
		rbrcc -name images resources/images.qrc -o lib/mastercoin-wallet/gui/images.rb

