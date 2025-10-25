pragma ComponentBehavior: Bound

import QtQuick
import QtCore
import QtQuick.Controls
import QtQuick.Dialogs
import QtLocation
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtPositioning
import "qrc:/qml/components" as FS

ApplicationWindow {
    id: root
    objectName: "mainwindow"
    width: 640
    height: 480
    visible: true
    title: Qt.application.name
    Material.theme: Material.Dark
    Material.accent: Material.theme === Material.Dark ?  Material.Yellow : Material.color(Material.Blue,Material.Shade700);
    Material.primary: Material.theme === Material.Dark ? Material.Indigo : Material.Cyan
    Material.background : Material.theme === Material.Dark ? "#116116116" : "#eedeedeed"
    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }

    Map {
        id: map
        property bool centerOnOwnship: false;
        anchors.fill: parent
        plugin: mapPlugin
        // visibleRegion: controller.areaOfInterest
        zoomLevel: 4
        color: "black"
        Rectangle {
            id: mainToolbar
            implicitHeight: 60
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            color: "transparent"
            //Material.foreground: "white"
            //Material.elevation: 2
            RowLayout {
                anchors.fill: parent
                spacing:10
                Item {
                    id: leftSpacer
                    Layout.minimumWidth:4
                }
                FS.BatteryStatus {
                    id: batteryStatus

                }
                Item {
                    id: midleSpacer
                    Layout.fillWidth: true
                }
                FS.VehicleStatus {
                    id: vehicleStatus

                }
                Item {
                    id: rightSpacer
                    Layout.minimumWidth:4
                }
            }
        }
    }
}
