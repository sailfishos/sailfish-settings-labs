/*
 * SPDX-License-Identifier: BSD-3-Clause
 * Copyright (c) 2026 Jolla Mobile Ltd
*/

import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent

        ViewPlaceholder {
            enabled: true
            //% "This is the Sailfish Labs™ Templace application"
            text: qsTrId("labtemplate-placeholder-name")
        }
    }
}
