import QtQuick 2.1
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    id: page

    // this is just here to have IDs for translations used in entries.json
    QtObject {
        //% "Swipe Edges"
        //: entry name in the settings
        property string pagename: qsTrId("settings-sailfish-labs-peekfilter-page")
    }

    property bool sliderDown

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        PullDownMenu {
            //% "Reset to default"
            //: menu entry
            MenuItem {
                text: qsTrId("settings-sailfish-labs-peekfilter-menu-reset")
                onDelayedClick: {
                    // setting a dconf key to undefined should 'dconf reset' it.
                    peekBoundary.value = undefined;
                    // close the page so the values are loaded again at next opening
                    pageStack.pop()
                }
            }
        }
        Column {
            id: column

            width: page.width - Theme.horizontalPageMargin * 2
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingMedium

            PageHeader {
                //% "Swipe Edges"
                //: Settings page title
                title: qsTrId("settings-sailfish-labs-peekfilter-page-title")
                //% "Settings Labs"
                description: qsTrId("settings-sailfish-labs-name")
            }

            SectionHeader {
                //% "Edge Width"
                //: section header
                text: qsTrId("settings-sailfish-labs-peekfilter-page-section-swipe")
            }

            Label {
                width: parent.width
                wrapMode: Text.Wrap
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeSmall
                //% "The slider below allows to adjust the area of the screen recognized as an 'Edge Swipe' gesture (as opposed to a swipe within an app window)."
                text: qsTrId("settings-sailfish-labs-peekfilter-page-label-top")
            }
            Item {
                height: Theme.paddingLarge
                width: parent.width
            }
            /* wallpaper image with small indicators of the edges.*/
            Rectangle {
                property double factor: 0.3
                anchors.horizontalCenter: parent.horizontalCenter

                height: Screen.height * factor
                width: Screen.width * factor
                color: "transparent"
                radius: width / 10

                Rectangle {
                    z: 15
                    clip: true
                    anchors.centerIn: parent
                    width: parent.width + border.width * 2
                    height: parent.height + border.width * 2
                    color: "transparent"
                    border.color: "black"
                    border.width:  Theme.paddingMedium
                    radius: width / 15
                }
                Image {
                    z: -1
                    anchors.fill: parent
                    anchors.centerIn: parent
                    source: Theme._homeBackgroundImage
                    sourceSize.height: parent.height
                    fillMode: Image.PreserveAspectCrop
                }
                Rectangle {
                    z: 10
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    width: slider.value * parent.factor
                    height: parent.height
                    color: Theme.rgba(Theme.highlightColor, Theme.opacityFaint)
                }
                Rectangle {
                    z: 10
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: slider.value * parent.factor
                    height: parent.height
                    color: Theme.rgba(Theme.highlightColor, Theme.opacityFaint)
                }

            }
            Item {
                height: Theme.paddingLarge
                width: parent.width
            }
            PeekSlider { id: slider
                value: peekBoundary.value
                onDownChanged: {
                    if (!down) peekBoundary.value = Math.floor( ( boundary >= 1) ? boundary : 0 )
                    sliderDown = down
                }
            }
            Label {
                width: parent.width - Theme.itemSizeSmall
                x: Theme.itemSizeSmall
                wrapMode: Text.Wrap
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeExtraSmall
                textFormat: Text.StyledText
                //% "Careful: setting this too low will result in you not being able to swipe away applications at all."
                text: qsTrId("settings-sailfish-labs-peekfilter-page-label-bottom")
            }
        }
    }
    /* page-level indicators of the edges, shown when the slider is down. */
    Rectangle {
        z: 10
        visible: sliderDown
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: slider.value
        height: parent.height
        color: Theme.rgba(((width < Theme.paddingLarge/2) ? "red" : Theme.highlightColor), Theme.opacityFaint)
    }
    Rectangle {
        z: 10
        visible: sliderDown
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        width: slider.value
        height: parent.height
        color: Theme.rgba(((width < Theme.paddingLarge/2) ? "red" : Theme.highlightColor), Theme.opacityFaint)
    }

    ConfigurationValue {
        id: peekBoundary

        key: "/desktop/lipstick-jolla-home/peekfilter/boundaryWidth"
    }
}

// vim: ft=javascript expandtab ts=4 sw=4 st=4
