import QtQuick 2.0

Rectangle {
    id: root
    width: 500
    height: 700
    color: "black"
    property int virtualWidth: 720
    property int virtualHeight: 1280
    property real currentScale: 1

    Component.onCompleted:  calculateSize()

    function calculateSize() {
        var aspectRatio = width / height
        var virtualAspectRatio = virtualWidth / virtualHeight
        if (aspectRatio > virtualAspectRatio) {
            currentScale = height / virtualHeight
        }
        else {
            currentScale = width / virtualWidth
        }
    }

    onWidthChanged: {
        calculateSize()
    }

    onHeightChanged: {
        calculateSize()
    }

    Rectangle {
        width: virtualWidth
        height: virtualHeight
        scale: currentScale
        anchors.centerIn: parent

        Text {
            anchors.centerIn: parent
            text: "Cinema"
            font.pointSize: 60
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }
}

