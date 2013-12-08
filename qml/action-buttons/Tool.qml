import QtQuick 2.0

Rectangle {
    id: root
    width: 145
    height: 145
    property alias text: label.text
    signal clicked

    Text {
        id: label
        anchors.centerIn: parent
        font.pointSize: 25
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }

}
