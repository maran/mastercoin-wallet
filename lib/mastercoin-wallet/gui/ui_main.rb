=begin
** Form generated from reading ui file 'main_window.ui'
**
** Created: Thu Nov 14 13:28:58 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :verticalLayout
    attr_reader :mainTab
    attr_reader :tab
    attr_reader :verticalLayout_2
    attr_reader :horizontalLayout
    attr_reader :balanceGroup
    attr_reader :verticalLayout_4
    attr_reader :mscBalanceLabel
    attr_reader :tMscBalanceLabel
    attr_reader :bitcoinLabel
    attr_reader :verticalLayout_3
    attr_reader :label_3
    attr_reader :mscAddressLabel
    attr_reader :overviewTree
    attr_reader :horizontalLayout_2
    attr_reader :horizontalSpacer
    attr_reader :simpleSendButton
    attr_reader :tab_2
    attr_reader :verticalLayout_5
    attr_reader :splitter
    attr_reader :layoutWidget
    attr_reader :verticalLayout_6
    attr_reader :label
    attr_reader :orderTree
    attr_reader :horizontalLayout_3
    attr_reader :label_4
    attr_reader :sellingButton
    attr_reader :layoutWidget_2
    attr_reader :verticalLayout_7
    attr_reader :label_2
    attr_reader :purchaseTree
    attr_reader :horizontalLayout_4
    attr_reader :label_5
    attr_reader :purchaseButton

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(746, 469)
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Expanding)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = mainWindow.sizePolicy.hasHeightForWidth
    mainWindow.sizePolicy = @sizePolicy
    mainWindow.sizeGripEnabled = true
    @verticalLayout = Qt::VBoxLayout.new(mainWindow)
    @verticalLayout.objectName = "verticalLayout"
    @mainTab = Qt::TabWidget.new(mainWindow)
    @mainTab.objectName = "mainTab"
    @sizePolicy.heightForWidth = @mainTab.sizePolicy.hasHeightForWidth
    @mainTab.sizePolicy = @sizePolicy
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @tab.enabled = true
    @sizePolicy.heightForWidth = @tab.sizePolicy.hasHeightForWidth
    @tab.sizePolicy = @sizePolicy
    @verticalLayout_2 = Qt::VBoxLayout.new(@tab)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @balanceGroup = Qt::GroupBox.new(@tab)
    @balanceGroup.objectName = "balanceGroup"
    @verticalLayout_4 = Qt::VBoxLayout.new(@balanceGroup)
    @verticalLayout_4.objectName = "verticalLayout_4"
    @mscBalanceLabel = Qt::Label.new(@balanceGroup)
    @mscBalanceLabel.objectName = "mscBalanceLabel"

    @verticalLayout_4.addWidget(@mscBalanceLabel)

    @tMscBalanceLabel = Qt::Label.new(@balanceGroup)
    @tMscBalanceLabel.objectName = "tMscBalanceLabel"

    @verticalLayout_4.addWidget(@tMscBalanceLabel)

    @bitcoinLabel = Qt::Label.new(@balanceGroup)
    @bitcoinLabel.objectName = "bitcoinLabel"

    @verticalLayout_4.addWidget(@bitcoinLabel)


    @horizontalLayout.addWidget(@balanceGroup)

    @verticalLayout_3 = Qt::VBoxLayout.new()
    @verticalLayout_3.objectName = "verticalLayout_3"
    @verticalLayout_3.setContentsMargins(-1, 2, -1, -1)
    @label_3 = Qt::Label.new(@tab)
    @label_3.objectName = "label_3"
    @sizePolicy1 = Qt::SizePolicy.new(Qt::SizePolicy::Preferred, Qt::SizePolicy::Fixed)
    @sizePolicy1.setHorizontalStretch(0)
    @sizePolicy1.setVerticalStretch(0)
    @sizePolicy1.heightForWidth = @label_3.sizePolicy.hasHeightForWidth
    @label_3.sizePolicy = @sizePolicy1
    @font = Qt::Font.new
    @font.bold = false
    @font.weight = 50
    @label_3.font = @font

    @verticalLayout_3.addWidget(@label_3)

    @mscAddressLabel = Qt::Label.new(@tab)
    @mscAddressLabel.objectName = "mscAddressLabel"
    @sizePolicy2 = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Preferred)
    @sizePolicy2.setHorizontalStretch(0)
    @sizePolicy2.setVerticalStretch(0)
    @sizePolicy2.heightForWidth = @mscAddressLabel.sizePolicy.hasHeightForWidth
    @mscAddressLabel.sizePolicy = @sizePolicy2
    @font1 = Qt::Font.new
    @font1.family = "Verdana"
    @font1.pointSize = 24
    @mscAddressLabel.font = @font1
    @mscAddressLabel.textInteractionFlags = Qt::LinksAccessibleByMouse|Qt::TextSelectableByMouse

    @verticalLayout_3.addWidget(@mscAddressLabel)


    @horizontalLayout.addLayout(@verticalLayout_3)


    @verticalLayout_2.addLayout(@horizontalLayout)

    @overviewTree = Qt::TreeWidget.new(@tab)
    @overviewTree.objectName = "overviewTree"
    @overviewTree.sortingEnabled = true
    @overviewTree.columnCount = 6

    @verticalLayout_2.addWidget(@overviewTree)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @horizontalSpacer = Qt::SpacerItem.new(0, 0, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @horizontalLayout_2.addItem(@horizontalSpacer)

    @simpleSendButton = Qt::PushButton.new(@tab)
    @simpleSendButton.objectName = "simpleSendButton"

    @horizontalLayout_2.addWidget(@simpleSendButton)


    @verticalLayout_2.addLayout(@horizontalLayout_2)

    @mainTab.addTab(@tab, Qt::Application.translate("MainWindow", "Dashboard", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @verticalLayout_5 = Qt::VBoxLayout.new(@tab_2)
    @verticalLayout_5.objectName = "verticalLayout_5"
    @splitter = Qt::Splitter.new(@tab_2)
    @splitter.objectName = "splitter"
    @splitter.orientation = Qt::Vertical
    @layoutWidget = Qt::Widget.new(@splitter)
    @layoutWidget.objectName = "layoutWidget"
    @verticalLayout_6 = Qt::VBoxLayout.new(@layoutWidget)
    @verticalLayout_6.objectName = "verticalLayout_6"
    @verticalLayout_6.setContentsMargins(0, 0, 0, 0)
    @label = Qt::Label.new(@layoutWidget)
    @label.objectName = "label"

    @verticalLayout_6.addWidget(@label)

    @orderTree = Qt::TreeWidget.new(@layoutWidget)
    @orderTree.objectName = "orderTree"
    @orderTree.sortingEnabled = true

    @verticalLayout_6.addWidget(@orderTree)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @label_4 = Qt::Label.new(@layoutWidget)
    @label_4.objectName = "label_4"
    @sizePolicy2.heightForWidth = @label_4.sizePolicy.hasHeightForWidth
    @label_4.sizePolicy = @sizePolicy2

    @horizontalLayout_3.addWidget(@label_4)

    @sellingButton = Qt::PushButton.new(@layoutWidget)
    @sellingButton.objectName = "sellingButton"

    @horizontalLayout_3.addWidget(@sellingButton)


    @verticalLayout_6.addLayout(@horizontalLayout_3)

    @splitter.addWidget(@layoutWidget)
    @layoutWidget_2 = Qt::Widget.new(@splitter)
    @layoutWidget_2.objectName = "layoutWidget_2"
    @verticalLayout_7 = Qt::VBoxLayout.new(@layoutWidget_2)
    @verticalLayout_7.objectName = "verticalLayout_7"
    @verticalLayout_7.setContentsMargins(0, 0, 0, 0)
    @label_2 = Qt::Label.new(@layoutWidget_2)
    @label_2.objectName = "label_2"

    @verticalLayout_7.addWidget(@label_2)

    @purchaseTree = Qt::TreeWidget.new(@layoutWidget_2)
    @purchaseTree.objectName = "purchaseTree"
    @purchaseTree.sortingEnabled = true

    @verticalLayout_7.addWidget(@purchaseTree)

    @horizontalLayout_4 = Qt::HBoxLayout.new()
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @label_5 = Qt::Label.new(@layoutWidget_2)
    @label_5.objectName = "label_5"
    @sizePolicy2.heightForWidth = @label_5.sizePolicy.hasHeightForWidth
    @label_5.sizePolicy = @sizePolicy2
    @label_5.wordWrap = true

    @horizontalLayout_4.addWidget(@label_5)

    @purchaseButton = Qt::PushButton.new(@layoutWidget_2)
    @purchaseButton.objectName = "purchaseButton"

    @horizontalLayout_4.addWidget(@purchaseButton)


    @verticalLayout_7.addLayout(@horizontalLayout_4)

    @splitter.addWidget(@layoutWidget_2)

    @verticalLayout_5.addWidget(@splitter)

    @mainTab.addTab(@tab_2, Qt::Application.translate("MainWindow", "Distributed exchange", nil, Qt::Application::UnicodeUTF8))

    @verticalLayout.addWidget(@mainTab)


    retranslateUi(mainWindow)

    @mainTab.setCurrentIndex(0)


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
    @label_3.text = Qt::Application.translate("MainWindow", "Mastercoin wallet for", nil, Qt::Application::UnicodeUTF8)
    @mscAddressLabel.text = Qt::Application.translate("MainWindow", "MSC Address", nil, Qt::Application::UnicodeUTF8)
    @overviewTree.headerItem.setText(0, Qt::Application.translate("MainWindow", "Address", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(1, Qt::Application.translate("MainWindow", "Amount", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(2, Qt::Application.translate("MainWindow", "Type", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(3, Qt::Application.translate("MainWindow", "Currency", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(4, Qt::Application.translate("MainWindow", "Date", nil, Qt::Application::UnicodeUTF8))
    @overviewTree.headerItem.setText(5, Qt::Application.translate("MainWindow", "Height", nil, Qt::Application::UnicodeUTF8))
    @simpleSendButton.text = Qt::Application.translate("MainWindow", "new Simple Send", nil, Qt::Application::UnicodeUTF8)
    @mainTab.setTabText(@mainTab.indexOf(@tab), Qt::Application.translate("MainWindow", "Dashboard", nil, Qt::Application::UnicodeUTF8))
    @label.text = Qt::Application.translate("MainWindow", "<h2>Order book</h2>", nil, Qt::Application::UnicodeUTF8)
    @orderTree.headerItem.setText(0, Qt::Application.translate("MainWindow", "Seller", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(1, Qt::Application.translate("MainWindow", "Currency", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(2, Qt::Application.translate("MainWindow", "Units available", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(3, Qt::Application.translate("MainWindow", "Price per coin", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(4, Qt::Application.translate("MainWindow", "Required fee", nil, Qt::Application::UnicodeUTF8))
    @orderTree.headerItem.setText(5, Qt::Application.translate("MainWindow", "Date", nil, Qt::Application::UnicodeUTF8))
    @orderTree.toolTip = Qt::Application.translate("MainWindow", "Double click to create a purchase offer from this Selling Offer", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("MainWindow", "Hint: You can double click to create a Purchase Offer for an item in the order book", nil, Qt::Application::UnicodeUTF8)
    @sellingButton.text = Qt::Application.translate("MainWindow", "New Selling Offer", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("MainWindow", "<h2>My purchase offers</h2>", nil, Qt::Application::UnicodeUTF8)
    @purchaseTree.headerItem.setText(0, Qt::Application.translate("MainWindow", "Offer address", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(1, Qt::Application.translate("MainWindow", "Amount", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(2, Qt::Application.translate("MainWindow", "Bitcoin amount", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(3, Qt::Application.translate("MainWindow", "Currency", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(4, Qt::Application.translate("MainWindow", "Offer status", nil, Qt::Application::UnicodeUTF8))
    @purchaseTree.headerItem.setText(5, Qt::Application.translate("MainWindow", "Date", nil, Qt::Application::UnicodeUTF8))
    @label_5.text = Qt::Application.translate("MainWindow", "Hint: You can double click to send the required Bitcoins for an accepted Purchase offer that's waiting on payment", nil, Qt::Application::UnicodeUTF8)
    @purchaseButton.text = Qt::Application.translate("MainWindow", "New Purchase Offer", nil, Qt::Application::UnicodeUTF8)
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

