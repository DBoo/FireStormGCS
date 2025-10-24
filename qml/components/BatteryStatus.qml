import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Rectangle {
    implicitHeight: 48
    implicitWidth: 78
    radius: 6
    border.width: 1
    border.color: useDarkTheme ? Qt.lighter(Material.background,.75) : Qt.darker(Material.background,.75)
    color: useDarkTheme ? Qt.lighter(Material.background,.25) : Qt.darker(Material.background,.25)
    property bool useDarkTheme: Material.theme === Material.Dark
    Image {
        id: battery_icon
        source: useDarkTheme ? "qrc:/icons/light/battery_full.svg" :"qrc:/icons/dark/battery_full.svg"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.width: 42
        sourceSize.height: 42
    }
    Label {
        id: battery_value
        anchors.left: battery_icon.right
        anchors.leftMargin: 2
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 8
        text: "100%"
    }
}
