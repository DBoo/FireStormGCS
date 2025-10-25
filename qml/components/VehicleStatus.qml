import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material


Rectangle {
    id: root
    implicitHeight: 48
    implicitWidth: 200
    radius: 6
    border.width: 1
    border.color: useDarkTheme ? Qt.lighter(Material.background,.75) : Qt.darker(Material.background,.75)
    color: useDarkTheme ? Qt.lighter(Material.background,.25) : Qt.darker(Material.background,.25)
    property bool useDarkTheme: Material.theme === Material.Dark
    Component.onCompleted: {
        root.color.a = 0.5
    }
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        spacing: 10
        Image {
            id: heading_icon
            source: useDarkTheme ? "qrc:/icons/light/compass.svg" :"qrc:/icons/dark/compass.svg"
            Layout.alignment: Qt.AlignVCenter
            sourceSize.width: 42
            sourceSize.height: 42

        }
        Label {
            id: headingValue
            Layout.alignment: Qt.AlignLeft
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 8
            text: "30"
        }
        Label {
            id: altitude

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 8
            text: "300'"
        }
        Label {
            id: velocity

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 8
            text: "20m/s"
        }
    }
}
