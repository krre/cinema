import QtQuick 2.0

Rectangle {
    id: root
    property alias text: label.text

    signal pressed

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

    MouseArea {
        anchors.fill: parent
        drag.target: root
        onPressed: root.pressed()
    }
}
