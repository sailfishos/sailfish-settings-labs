/*
 * Copyright (c) 2026 Peter G. (nephros)
 * SPDX-License-Identifier: Apache-2.0
 * SPDX-License-Identifier: BSD-3-Clause
 */


import QtQuick 2.1
import Sailfish.Silica 1.0

Page { id: root

    // Add your additional config here:
    readonly property var subcomponents: [ "quickapptoggle" ]

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        PullDownMenu {
            MenuItem {
                //% "Reset to default"
                //: menu entry
                text: qsTrId("settings-sailfish_labs-quick-app-toggle-menu-reset")
                onDelayedClick: quickAppToggleConfig.value = quickAppToggleConfig.defaultValue()
            }
        }
        Column { id: column
            width: page.width - Theme.horizontalPageMargin
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingMedium

            PageHeader {
                //% "Quick App Switching"
                //: section header
                title: qsTrId("settings-sailfish_labs-quick-app-toggle-page-adv-section-quicksw")
            }
            Repeater { // or ColumnView??
                model: root.subcomponents
                delegate: Loader {
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: Qt.resolvedUrl("components/" + modelData + ".qml")
                }
            }
        }
    }
}

// vim: ft=javascript expandtab ts=4 sw=4 st=4 syntax=qml
