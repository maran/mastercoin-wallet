=begin
** Form generated from reading ui file 'purchase_offer_window.ui'
**
** Created: Sat Nov 2 15:12:58 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_PurchaseOffer
    attr_reader :verticalLayoutWidget
    attr_reader :verticalLayout
    attr_reader :gridLayout
    attr_reader :password_input
    attr_reader :currency_box
    attr_reader :label_3
    attr_reader :label_2
    attr_reader :amount_input
    attr_reader :label_4
    attr_reader :address_input
    attr_reader :label_5
    attr_reader :fee_input
    attr_reader :label_6
    attr_reader :label
    attr_reader :submit_button

    def setupUi(purchaseOffer)
    if purchaseOffer.objectName.nil?
        purchaseOffer.objectName = "purchaseOffer"
    end
    purchaseOffer.resize(534, 238)
    @verticalLayoutWidget = Qt::Widget.new(purchaseOffer)
    @verticalLayoutWidget.objectName = "verticalLayoutWidget"
    @verticalLayoutWidget.geometry = Qt::Rect.new(9, 39, 518, 148)
    @verticalLayout = Qt::VBoxLayout.new(@verticalLayoutWidget)
    @verticalLayout.objectName = "verticalLayout"
    @verticalLayout.setContentsMargins(0, 0, 0, 0)
    @gridLayout = Qt::GridLayout.new()
    @gridLayout.objectName = "gridLayout"
    @password_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @password_input.objectName = "password_input"
    @password_input.echoMode = Qt::LineEdit::Password

    @gridLayout.addWidget(@password_input, 4, 1, 1, 1)

    @currency_box = Qt::ComboBox.new(@verticalLayoutWidget)
    @currency_box.objectName = "currency_box"

    @gridLayout.addWidget(@currency_box, 3, 1, 1, 1)

    @label_3 = Qt::Label.new(@verticalLayoutWidget)
    @label_3.objectName = "label_3"

    @gridLayout.addWidget(@label_3, 1, 0, 1, 1)

    @label_2 = Qt::Label.new(@verticalLayoutWidget)
    @label_2.objectName = "label_2"

    @gridLayout.addWidget(@label_2, 0, 0, 1, 1)

    @amount_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @amount_input.objectName = "amount_input"

    @gridLayout.addWidget(@amount_input, 1, 1, 1, 1)

    @label_4 = Qt::Label.new(@verticalLayoutWidget)
    @label_4.objectName = "label_4"

    @gridLayout.addWidget(@label_4, 3, 0, 1, 1)

    @address_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @address_input.objectName = "address_input"
    @address_input.minimumSize = Qt::Size.new(300, 0)

    @gridLayout.addWidget(@address_input, 0, 1, 1, 1)

    @label_5 = Qt::Label.new(@verticalLayoutWidget)
    @label_5.objectName = "label_5"

    @gridLayout.addWidget(@label_5, 4, 0, 1, 1)

    @fee_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @fee_input.objectName = "fee_input"

    @gridLayout.addWidget(@fee_input, 2, 1, 1, 1)

    @label_6 = Qt::Label.new(@verticalLayoutWidget)
    @label_6.objectName = "label_6"

    @gridLayout.addWidget(@label_6, 2, 0, 1, 1)


    @verticalLayout.addLayout(@gridLayout)

    @label = Qt::Label.new(purchaseOffer)
    @label.objectName = "label"
    @label.geometry = Qt::Rect.new(20, 10, 161, 21)
    @submit_button = Qt::PushButton.new(purchaseOffer)
    @submit_button.objectName = "submit_button"
    @submit_button.enabled = false
    @submit_button.geometry = Qt::Rect.new(410, 190, 114, 32)
    @submit_button.autoDefault = false
    Qt::Widget.setTabOrder(@address_input, @amount_input)
    Qt::Widget.setTabOrder(@amount_input, @currency_box)
    Qt::Widget.setTabOrder(@currency_box, @password_input)
    Qt::Widget.setTabOrder(@password_input, @submit_button)

    retranslateUi(purchaseOffer)

    Qt::MetaObject.connectSlotsByName(purchaseOffer)
    end # setupUi

    def setup_ui(purchaseOffer)
        setupUi(purchaseOffer)
    end

    def retranslateUi(purchaseOffer)
    purchaseOffer.windowTitle = Qt::Application.translate("PurchaseOffer", "New Purchase Offer", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("PurchaseOffer", "Amount", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("PurchaseOffer", "Masteroin address", nil, Qt::Application::UnicodeUTF8)
    @amount_input.placeholderText = ''
    @label_4.text = Qt::Application.translate("PurchaseOffer", "Currency", nil, Qt::Application::UnicodeUTF8)
    @address_input.placeholderText = ''
    @label_5.text = Qt::Application.translate("PurchaseOffer", "Password", nil, Qt::Application::UnicodeUTF8)
    @label_6.text = Qt::Application.translate("PurchaseOffer", "Required fee", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("PurchaseOffer", "<html><head/><body><p><span style=\" font-size:large; font-weight:600;\">New Purchase Offer</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @submit_button.text = Qt::Application.translate("PurchaseOffer", "Send", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(purchaseOffer)
        retranslateUi(purchaseOffer)
    end

end

module Ui
    class PurchaseOffer < Ui_PurchaseOffer
    end
end  # module Ui

