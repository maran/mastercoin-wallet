=begin
** Form generated from reading ui file 'selling_offer_window.ui'
**
** Created: Thu Oct 24 14:58:04 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_SellingOffer
    attr_reader :verticalLayoutWidget
    attr_reader :verticalLayout
    attr_reader :gridLayout
    attr_reader :fee_input
    attr_reader :password_input
    attr_reader :label_5
    attr_reader :label_6
    attr_reader :amount_input
    attr_reader :label_3
    attr_reader :label_4
    attr_reader :currency_box
    attr_reader :label_2
    attr_reader :lineEdit
    attr_reader :btc_amount_input
    attr_reader :label_7
    attr_reader :label
    attr_reader :submit_button

    def setupUi(sellingOffer)
    if sellingOffer.objectName.nil?
        sellingOffer.objectName = "sellingOffer"
    end
    sellingOffer.resize(534, 276)
    @verticalLayoutWidget = Qt::Widget.new(sellingOffer)
    @verticalLayoutWidget.objectName = "verticalLayoutWidget"
    @verticalLayoutWidget.geometry = Qt::Rect.new(9, 39, 518, 179)
    @verticalLayout = Qt::VBoxLayout.new(@verticalLayoutWidget)
    @verticalLayout.objectName = "verticalLayout"
    @verticalLayout.setContentsMargins(0, 0, 0, 0)
    @gridLayout = Qt::GridLayout.new()
    @gridLayout.objectName = "gridLayout"
    @fee_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @fee_input.objectName = "fee_input"
    @fee_input.minimumSize = Qt::Size.new(300, 0)

    @gridLayout.addWidget(@fee_input, 6, 1, 1, 1)

    @password_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @password_input.objectName = "password_input"
    @password_input.echoMode = Qt::LineEdit::Password

    @gridLayout.addWidget(@password_input, 7, 1, 1, 1)

    @label_5 = Qt::Label.new(@verticalLayoutWidget)
    @label_5.objectName = "label_5"

    @gridLayout.addWidget(@label_5, 7, 0, 1, 1)

    @label_6 = Qt::Label.new(@verticalLayoutWidget)
    @label_6.objectName = "label_6"

    @gridLayout.addWidget(@label_6, 5, 0, 1, 1)

    @amount_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @amount_input.objectName = "amount_input"

    @gridLayout.addWidget(@amount_input, 1, 1, 1, 1)

    @label_3 = Qt::Label.new(@verticalLayoutWidget)
    @label_3.objectName = "label_3"

    @gridLayout.addWidget(@label_3, 1, 0, 1, 1)

    @label_4 = Qt::Label.new(@verticalLayoutWidget)
    @label_4.objectName = "label_4"

    @gridLayout.addWidget(@label_4, 3, 0, 1, 1)

    @currency_box = Qt::ComboBox.new(@verticalLayoutWidget)
    @currency_box.objectName = "currency_box"

    @gridLayout.addWidget(@currency_box, 3, 1, 1, 1)

    @label_2 = Qt::Label.new(@verticalLayoutWidget)
    @label_2.objectName = "label_2"

    @gridLayout.addWidget(@label_2, 6, 0, 1, 1)

    @lineEdit = Qt::LineEdit.new(@verticalLayoutWidget)
    @lineEdit.objectName = "lineEdit"

    @gridLayout.addWidget(@lineEdit, 5, 1, 1, 1)

    @btc_amount_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @btc_amount_input.objectName = "btc_amount_input"

    @gridLayout.addWidget(@btc_amount_input, 2, 1, 1, 1)

    @label_7 = Qt::Label.new(@verticalLayoutWidget)
    @label_7.objectName = "label_7"

    @gridLayout.addWidget(@label_7, 2, 0, 1, 1)


    @verticalLayout.addLayout(@gridLayout)

    @label = Qt::Label.new(sellingOffer)
    @label.objectName = "label"
    @label.geometry = Qt::Rect.new(10, 10, 151, 21)
    @submit_button = Qt::PushButton.new(sellingOffer)
    @submit_button.objectName = "submit_button"
    @submit_button.enabled = false
    @submit_button.geometry = Qt::Rect.new(420, 230, 114, 32)
    @submit_button.autoDefault = false

    retranslateUi(sellingOffer)

    Qt::MetaObject.connectSlotsByName(sellingOffer)
    end # setupUi

    def setup_ui(sellingOffer)
        setupUi(sellingOffer)
    end

    def retranslateUi(sellingOffer)
    sellingOffer.windowTitle = Qt::Application.translate("SellingOffer", "New Simple Send", nil, Qt::Application::UnicodeUTF8)
    @fee_input.placeholderText = ''
    @label_5.text = Qt::Application.translate("SellingOffer", "Password", nil, Qt::Application::UnicodeUTF8)
    @label_6.text = Qt::Application.translate("SellingOffer", "Time (in blocks)", nil, Qt::Application::UnicodeUTF8)
    @amount_input.placeholderText = ''
    @label_3.text = Qt::Application.translate("SellingOffer", "Amount to sell", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("SellingOffer", "Currency", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("SellingOffer", "Transaction fee", nil, Qt::Application::UnicodeUTF8)
    @label_7.text = Qt::Application.translate("SellingOffer", "Total amount of BTC", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("SellingOffer", "<html><head/><body><p><span style=\" font-size:large; font-weight:600;\">New Selling Offer</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @submit_button.text = Qt::Application.translate("SellingOffer", "Send", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(sellingOffer)
        retranslateUi(sellingOffer)
    end

end

module Ui
    class SellingOffer < Ui_SellingOffer
    end
end  # module Ui

