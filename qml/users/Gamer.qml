import QtQuick 2.0

Rectangle {
    property alias name: name.text
    property alias money: money.text
    property alias audience: audience.text

    width: 229
    height: 253
    color: "#cdffca"

    Image {
        id: avatar
        source: "../images/no_avatar.png"
        anchors.right: parent.right
        anchors.top: parent.top
    }

    Text {
        id: name
        y: 150
        width: avatar.width
        height: 80
        anchors.left: avatar.left
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: qsTr("Я горячо любимый")
        font.pointSize: 20
        wrapMode: Text.WordWrap
    }

    Column {
        x: 2
        height: parent.height
        anchors.left: parent.left
        anchors.right: avatar.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5

        Image {
            source: "../images/star.png"
            scale: 0.9
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: score
            text: "0"
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "$"
            font.pointSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: money
            text: "0"
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            source: "../images/eye.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: audience
            text: "0"
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
