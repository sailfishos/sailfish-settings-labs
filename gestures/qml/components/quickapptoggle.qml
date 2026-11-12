/*
 * Copyright (c) 2026 Peter G. (nephros)
 * SPDX-License-Identifier: Apache-2.0
 * SPDX-License-Identifier: BSD-3-Clause
 */


import QtQuick 2.1
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Item { id: root
    height: column.height

    Column {
        id: column

        width: page.width - Theme.horizontalPageMargin
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: Theme.paddingMedium

        SectionHeader {
            //% "Quick App Switching"
            //: section header
            text: qsTrId("settings-sailfish_labs-quickapptoggle-header")
         }

        Label {
            width: parent.width
            wrapMode: Text.Wrap
            color: Theme.secondaryHighlightColor
            textFormat: Text.StyledText
            font.pixelSize: Theme.fontSizeSmall
            //% "Similar to pressing Alt + Tab on a desktop to switch to the previous app window. However, Quick App Switching can only jump to the previous app."
            text: qsTrId("settings-sailfish_labs-quickapptoggle-label")
        }
        TextSwitch {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            checked: quickAppToggleConfig.value
            automaticCheck: true
            //% "Quick App Switching"
            //: quick app switch text
            text: qsTrId("settings-sailfish_labs-quickapptoggle-sw-label")
            //% "Once enabled you can switch from the foregound app to the previous one by doing a long peek gesture."
            //: quick app switch description
            description: qsTrId("settings-sailfish_labs-quickapptoggle-sw-desc")
            onClicked: quickAppToggleConfig.value = !quickAppToggleConfig.value
        }
    }

    ConfigurationValue {
        id: quickAppToggleConfig

        key: "/desktop/sailfish/experimental/quickAppToggleGesture"
        defaultValue: false
    }
}

// vim: ft=javascript expandtab ts=4 sw=4 st=4 syntax=qml
