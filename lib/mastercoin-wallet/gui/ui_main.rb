=begin
** Form generated from reading ui file 'main_window.ui'
**
** Created: Tue Nov 5 21:06:14 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :mainTab
    attr_reader :tab
    attr_reader :balanceGroup
    attr_reader :mscBalanceLabel
    attr_reader :tMscBalanceLabel
    attr_reader :bitcoinLabel
    attr_reader :mscAddressLabel
    attr_reader :overviewTree
    attr_reader :simpleSendButton
    attr_reader :label_3
    attr_reader :tab_2
    attr_reader :orderTree
    attr_reader :label
    attr_reader :sellingButton
    attr_reader :purchaseTree
    attr_reader :label_2
    attr_reader :purchaseButton
    attr_reader :label_4
    attr_reader :label_5

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(746, 469)
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Fixed, Qt::SizePolicy::Fixed)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = mainWindow.sizePolicy.hasHeightForWidth
    mainWindow.sizePolicy = @sizePolicy
    @mainTab = Qt::TabWidget.new(mainWindow)
    @mainTab.objectName = "mainTab"
    @mainTab.geometry = Qt::Rect.new(10, 10, 731, 451)
    @sizePolicy.heightForWidth = @mainTab.sizePolicy.hasHeightForWidth
    @mainTab.sizePolicy = @sizePolicy
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @balanceGroup = Qt::GroupBox.new(@tab)
    @balanceGroup.objectName = "balanceGroup"
    @balanceGroup.geometry = Qt::Rect.new(10, 0, 201, 111)
    @mscBalanceLabel = Qt::Label.new(@balanceGroup)
    @mscBalanceLabel.objectName = "mscBalanceLabel"
    @mscBalanceLabel.geometry = Qt::Rect.new(10, 30, 181, 19)
    @tMscBalanceLabel = Qt::Label.new(@balanceGroup)
    @tMscBalanceLabel.objectName = "tMscBalanceLabel"
    @tMscBalanceLabel.geometry = Qt::Rect.new(10, 50, 171, 20)
    @bitcoinLabel = Qt::Label.new(@balanceGroup)
    @bitcoinLabel.objectName = "bitcoinLabel"
    @bitcoinLabel.geometry = Qt::Rect.new(10, 70, 171, 19)
    @mscAddressLabel = Qt::Label.new(@tab)
    @mscAddressLabel.objectName = "mscAddressLabel"
    @mscAddressLabel.geometry = Qt::Rect.new(220, 40, 471, 51)
    @font = Qt::Font.new
    @font.family = "Verdana"
    @font.pointSize = 24
    @mscAddressLabel.font = @font
    @overviewTree = Qt::TreeWidget.new(@tab)
    @overviewTree.objectName = "overviewTree"
    @overviewTree.geometry = Qt::Rect.new(10, 120, 711, 251)
    @overviewTree.sortingEnabled = true
    @overviewTree.columnCount = 5
    @simpleSendButton = Qt::PushButton.new(@tab)
    @simpleSendButton.objectName = "simpleSendButton"
    @simpleSendButton.geometry = Qt::Rect.new(580, 380, 141, 32)
    @label_3 = Qt::Label.new(@tab)
    @label_3.objectName = "label_3"
    @label_3.geometry = Qt::Rect.new(220, 20, 231, 19)
    @mainTab.addTab(@tab, Qt::Application.translate("MainWindow", "Dashboard", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @orderTree = Qt::TreeWidget.new(@tab_2)
    @orderTree.objectName = "orderTree"
    @orderTree.geometry = Qt::Rect.new(10, 30, 701, 131)
    @orderTree.sortingEnabled = true
    @label = Qt::Label.new(@tab_2)
    @label.objectName = "label"
    @label.geometry = Qt::Rect.new(10, -2, 321, 31)
    @sellingButton = Qt::PushButton.new(@tab_2)
    @sellingButton.objectName = "sellingButton"
    @sellingButton.geometry = Qt::Rect.new(580, 160, 131, 32)
    @purchaseTree = Qt::TreeWidget.new(@tab_2)
    @purchaseTree.objectName = "purchaseTree"
    @purchaseTree.geometry = Qt::Rect.new(10, 250, 701, 131)
    @purchaseTree.sortingEnabled = true
    @label_2 = Qt::Label.new(@tab_2)
    @label_2.objectName = "label_2"
    @label_2.geometry = Qt::Rect.new(10, 210, 411, 31)
    @purchaseButton = Qt::PushButton.new(@tab_2)
    @purchaseButton.objectName = "purchaseButton"
    @purchaseButton.geometry = Qt::Rect.new(560, 380, 151, 32)
    @label_4 = Qt::Label.new(@tab_2)
    @label_4.objectName = "label_4"
    @label_4.geometry = Qt::Rect.new(10, 160, 521, 21)
    @label_5 = Qt::Label.new(@tab_2)
    @label_5.objectName = "label_5"
    @label_5.geometry = Qt::Rect.new(10, 380, 521, 41)
    @label_5.wordWrap = true
    @mainTab.addTab(@tab_2, Qt::Application.translate("MainWindow", "Distributed exchange", nil, Qt::Application::UnicodeUTF8))

    retranslateUi(mainWindow)

    @mainTab.setCurrentIndex(1)


    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "New Purchase Offer", nil, Qt::Application::UnicodeUTF8)
    @balanceGroup.title = Qt::Application.translate("MainWindow", "Balances", nil, Qt::Application::UnicodeUTF8)
    @mscBalanceLabel.text = Qt::Application.translate("MainWindow", "Updating MSC balance", nil, Qt::Application::UnicodeUTF8)
    @tMscBalanceLabel.text = Qt::Application.translate("MainWindow", "Updating test MSC balance", nil, Qt::Application::UnicodeUTF8)
    @bitcoinLabel.text = Qt::Application.translate("MainWindow", "Updating Bitcoin balance", nil, Qt::Application::UnicodeUTF8)
    @mscAddressLabel.text = Qt::Application.translate("MainWindow", "MSC Address", nil, Qt::Application::UnicodeUTF8)
    @overviewTree.headerItem.setText(0, Qt::Application.translate("MainWindow", "Address", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(1, Qt::Application.translate("MainWindow", "Amount", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(2, Qt::Application.translate("MainWindow", "Type", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(3, Qt::Application.translate("MainWindow", "Currency", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(4, Qt::Application.translate("MainWindow", "Date", nil, Qt::Application::UnicodeUTF8))
    @simpleSendButton.text = Qt::Application.translate("MainWindow", "new Simple Send", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("MainWindow", "Mastercoin wallet for", nil, Qt::Application::UnicodeUTF8)
    @mainTab.setTabText(@mainTab.indexOf(@tab), Qt::Application.translate("MainWindow", "Dashboard", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(0, Qt::Application.translate("MainWindow", "Seller", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(1, Qt::Application.translate("MainWindow", "Currency", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(2, Qt::Application.translate("MainWindow", "Units available", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(3, Qt::Application.translate("MainWindow", "Price per coin", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(4, Qt::Application.translate("MainWindow", "Required fee", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(5, Qt::Application.translate("MainWindow", "Date", nil, Qt::Application::UnicodeUTF8))
    @orderTree.toolTip = Qt::Application.translate("MainWindow", "Double click to create a purchase offer from this Selling Offer", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("MainWindow", "<h2>Order book</h2>", nil, Qt::Application::UnicodeUTF8)
    @sellingButton.text = Qt::Application.translate("MainWindow", "New Selling Offer", nil, Qt::Application::UnicodeUTF8)
    @purchaseTree.headerItem.setText(0, Qt::Application.translate("MainWindow", "Offer address", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(1, Qt::Application.translate("MainWindow", "Amount", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(2, Qt::Application.translate("MainWindow", "Bitcoin amount", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(3, Qt::Application.translate("MainWindow", "Currency", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(4, Qt::Application.translate("MainWindow", "Offer status", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(5, Qt::Application.translate("MainWindow", "Date", nil, Qt::Application::UnicodeUTF8))
    @label_2.text = Qt::Application.translate("MainWindow", "<h2>My purchase offers</h2>", nil, Qt::Application::UnicodeUTF8)
    @purchaseButton.text = Qt::Application.translate("MainWindow", "New Purchase Offer", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("MainWindow", "Hint: You can double click to create a Purchase Offer for an item in the order book", nil, Qt::Application::UnicodeUTF8)
    @label_5.text = Qt::Application.translate("MainWindow", "Hint: You can double click to send the required Bitcoins for an accepted Purchase offer that's waiting on payment", nil, Qt::Application::UnicodeUTF8)
    @mainTab.setTabText(@mainTab.indexOf(@tab_2), Qt::Application.translate("MainWindow", "Distributed exchange", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

