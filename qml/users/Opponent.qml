import QtQuick 2.0

Rectangle {
    property alias name: name.text
    property alias score: score.text
    width: 140
    height: 143

    Text {
        id: name
        y: 8
        width: parent.width
        text: qsTr("Игрок")
        font.pointSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    Image {
        y: 45
        scale: 0.7
        source: "../images/star.png"
    }

    Text {
        id: score
        y: 90
        width: 50
        text: "0"
        font.pointSize: 20
        horizontalAlignment: Text.AlignHCenter

    }

    Image {
        width: 90
        height: 90
        source: "../images/no_avatar.png"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
