=begin
** Form generated from reading ui file 'bitcoin_offer_window.ui'
**
** Created: Sun Nov 3 15:14:29 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_BitcoinOffer
    attr_reader :verticalLayoutWidget
    attr_reader :verticalLayout
    attr_reader :gridLayout
    attr_reader :passwordInput
    attr_reader :addressInput
    attr_reader :label_2
    attr_reader :label_3
    attr_reader :label_5
    attr_reader :amountInput
    attr_reader :label
    attr_reader :submit_button

    def setupUi(bitcoinOffer)
    if bitcoinOffer.objectName.nil?
        bitcoinOffer.objectName = "bitcoinOffer"
    end
    bitcoinOffer.resize(534, 238)
    @verticalLayoutWidget = Qt::Widget.new(bitcoinOffer)
    @verticalLayoutWidget.objectName = "verticalLayoutWidget"
    @verticalLayoutWidget.geometry = Qt::Rect.new(9, 39, 518, 148)
    @verticalLayout = Qt::VBoxLayout.new(@verticalLayoutWidget)
    @verticalLayout.objectName = "verticalLayout"
    @verticalLayout.setContentsMargins(0, 0, 0, 0)
    @gridLayout = Qt::GridLayout.new()
    @gridLayout.objectName = "gridLayout"
    @passwordInput = Qt::LineEdit.new(@verticalLayoutWidget)
    @passwordInput.objectName = "passwordInput"
    @passwordInput.echoMode = Qt::LineEdit::Password

    @gridLayout.addWidget(@passwordInput, 2, 1, 1, 1)

    @addressInput = Qt::LineEdit.new(@verticalLayoutWidget)
    @addressInput.objectName = "addressInput"
    @addressInput.minimumSize = Qt::Size.new(300, 0)

    @gridLayout.addWidget(@addressInput, 0, 1, 1, 1)

    @label_2 = Qt::Label.new(@verticalLayoutWidget)
    @label_2.objectName = "label_2"

    @gridLayout.addWidget(@label_2, 0, 0, 1, 1)

    @label_3 = Qt::Label.new(@verticalLayoutWidget)
    @label_3.objectName = "label_3"

    @gridLayout.addWidget(@label_3, 1, 0, 1, 1)

    @label_5 = Qt::Label.new(@verticalLayoutWidget)
    @label_5.objectName = "label_5"

    @gridLayout.addWidget(@label_5, 2, 0, 1, 1)

    @amountInput = Qt::LineEdit.new(@verticalLayoutWidget)
    @amountInput.objectName = "amountInput"

    @gridLayout.addWidget(@amountInput, 1, 1, 1, 1)


    @verticalLayout.addLayout(@gridLayout)

    @label = Qt::Label.new(bitcoinOffer)
    @label.objectName = "label"
    @label.geometry = Qt::Rect.new(10, 0, 231, 31)
    @submit_button = Qt::PushButton.new(bitcoinOffer)
    @submit_button.objectName = "submit_button"
    @submit_button.enabled = false
    @submit_button.geometry = Qt::Rect.new(410, 190, 114, 32)
    @submit_button.autoDefault = false
    Qt::Widget.setTabOrder(@addressInput, @amountInput)
    Qt::Widget.setTabOrder(@amountInput, @passwordInput)
    Qt::Widget.setTabOrder(@passwordInput, @submit_button)

    retranslateUi(bitcoinOffer)

    Qt::MetaObject.connectSlotsByName(bitcoinOffer)
    end # setupUi

    def setup_ui(bitcoinOffer)
        setupUi(bitcoinOffer)
    end

    def retranslateUi(bitcoinOffer)
    bitcoinOffer.windowTitle = Qt::Application.translate("BitcoinOffer", "New Purchase Offer", nil, Qt::Application::UnicodeUTF8)
    @addressInput.placeholderText = ''
    @label_2.text = Qt::Application.translate("BitcoinOffer", "Masteroin address", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("BitcoinOffer", "Amount", nil, Qt::Application::UnicodeUTF8)
    @label_5.text = Qt::Application.translate("BitcoinOffer", "Password", nil, Qt::Application::UnicodeUTF8)
    @amountInput.placeholderText = ''
    @label.text = Qt::Application.translate("BitcoinOffer", "<h3>Pay for Purchase Offer</h3>", nil, Qt::Application::UnicodeUTF8)
    @submit_button.text = Qt::Application.translate("BitcoinOffer", "Send", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(bitcoinOffer)
        retranslateUi(bitcoinOffer)
    end

end

module Ui
    class BitcoinOffer < Ui_BitcoinOffer
    end
end  # module Ui

