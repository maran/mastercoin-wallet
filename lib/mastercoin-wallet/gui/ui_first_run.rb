=begin
** Form generated from reading ui file 'first_run_window.ui'
**
** Created: Wed Sep 25 15:48:58 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_FirstRunWindow
    attr_reader :verticalLayoutWidget
    attr_reader :verticalLayout
    attr_reader :label
    attr_reader :horizontalSpacer
    attr_reader :label_3
    attr_reader :horizontalLayout_2
    attr_reader :label_4
    attr_reader :password_input
    attr_reader :horizontalLayout_3
    attr_reader :label_5
    attr_reader :repeat_password_input
    attr_reader :fault
    attr_reader :horizontalSpacer_2
    attr_reader :horizontalLayout
    attr_reader :label_2
    attr_reader :private_key_input
    attr_reader :address
    attr_reader :submit_button

    def setupUi(firstRunWindow)
    if firstRunWindow.objectName.nil?
        firstRunWindow.objectName = "firstRunWindow"
    end
    firstRunWindow.resize(540, 288)
    @verticalLayoutWidget = Qt::Widget.new(firstRunWindow)
    @verticalLayoutWidget.objectName = "verticalLayoutWidget"
    @verticalLayoutWidget.geometry = Qt::Rect.new(0, 0, 520, 258)
    @verticalLayout = Qt::VBoxLayout.new(@verticalLayoutWidget)
    @verticalLayout.spacing = 5
    @verticalLayout.objectName = "verticalLayout"
    @verticalLayout.setContentsMargins(20, 0, 0, 0)
    @label = Qt::Label.new(@verticalLayoutWidget)
    @label.objectName = "label"

    @verticalLayout.addWidget(@label)

    @horizontalSpacer = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @verticalLayout.addItem(@horizontalSpacer)

    @label_3 = Qt::Label.new(@verticalLayoutWidget)
    @label_3.objectName = "label_3"
    @label_3.textFormat = Qt::AutoText
    @label_3.scaledContents = false
    @label_3.wordWrap = true

    @verticalLayout.addWidget(@label_3)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @label_4 = Qt::Label.new(@verticalLayoutWidget)
    @label_4.objectName = "label_4"
    @label_4.minimumSize = Qt::Size.new(200, 0)

    @horizontalLayout_2.addWidget(@label_4)

    @password_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @password_input.objectName = "password_input"
    @password_input.echoMode = Qt::LineEdit::Password

    @horizontalLayout_2.addWidget(@password_input)


    @verticalLayout.addLayout(@horizontalLayout_2)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @label_5 = Qt::Label.new(@verticalLayoutWidget)
    @label_5.objectName = "label_5"
    @label_5.minimumSize = Qt::Size.new(200, 0)

    @horizontalLayout_3.addWidget(@label_5)

    @repeat_password_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @repeat_password_input.objectName = "repeat_password_input"
    @repeat_password_input.echoMode = Qt::LineEdit::Password

    @horizontalLayout_3.addWidget(@repeat_password_input)


    @verticalLayout.addLayout(@horizontalLayout_3)

    @fault = Qt::Label.new(@verticalLayoutWidget)
    @fault.objectName = "fault"

    @verticalLayout.addWidget(@fault)

    @horizontalSpacer_2 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @verticalLayout.addItem(@horizontalSpacer_2)

    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @label_2 = Qt::Label.new(@verticalLayoutWidget)
    @label_2.objectName = "label_2"
    @label_2.minimumSize = Qt::Size.new(200, 0)

    @horizontalLayout.addWidget(@label_2)

    @private_key_input = Qt::LineEdit.new(@verticalLayoutWidget)
    @private_key_input.objectName = "private_key_input"

    @horizontalLayout.addWidget(@private_key_input)


    @verticalLayout.addLayout(@horizontalLayout)

    @address = Qt::Label.new(@verticalLayoutWidget)
    @address.objectName = "address"

    @verticalLayout.addWidget(@address)

    @submit_button = Qt::PushButton.new(firstRunWindow)
    @submit_button.objectName = "submit_button"
    @submit_button.enabled = false
    @submit_button.geometry = Qt::Rect.new(410, 250, 114, 32)

    retranslateUi(firstRunWindow)

    Qt::MetaObject.connectSlotsByName(firstRunWindow)
    end # setupUi

    def setup_ui(firstRunWindow)
        setupUi(firstRunWindow)
    end

    def retranslateUi(firstRunWindow)
    firstRunWindow.windowTitle = Qt::Application.translate("firstRunWindow", "First run ", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("firstRunWindow", "<h3>Mastercoin setup</h3>", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("firstRunWindow", "To setup this wallet you need to enter the private key for\n" \
"your Mastercoin address. We will use this key to generate\n" \
"and broadcast valid Mastercoin transactions.", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("firstRunWindow", "Encryption password", nil, Qt::Application::UnicodeUTF8)
    @label_5.text = Qt::Application.translate("firstRunWindow", "Repeat password", nil, Qt::Application::UnicodeUTF8)
    @fault.text = ''
    @label_2.text = Qt::Application.translate("firstRunWindow", "Mastercoin address private key", nil, Qt::Application::UnicodeUTF8)
    @address.text = ''
    @submit_button.text = Qt::Application.translate("firstRunWindow", "Done", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(firstRunWindow)
        retranslateUi(firstRunWindow)
    end

end

module Ui
    class FirstRunWindow < Ui_FirstRunWindow
    end
end  # module Ui

