import QtQuick 2.0

Rectangle {
    property alias text: label.text

    width: 93
    height: 158
    color: "#c3beff"
    border.color: "black"
    border.width: 3

    Text {
        id: label
        anchors.centerIn: parent
        font.pointSize: 15
    }
}
