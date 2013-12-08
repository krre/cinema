import QtQuick 2.0

Rectangle {
    property alias text: label.text

    width: 200
    height: 340
    color: "#c3beff"
    border.color: "black"
    border.width: 3

    Text {
        id: label
        anchors.centerIn: parent
        font.pointSize: 25
    }
}
