import QtQuick 2.1
import "../js/data.js" as Data
import "../js/gamer.js" as Gamer

Rectangle {
    id: root
    width: 500
    height: 700
    color: "black"
    property int virtualWidth: 720
    property int virtualHeight: 1280
    property real currentScale: 1
    property var gameData: Data.init()

    Component.onCompleted: {
        calculateSize()
    }

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

        PhaseScreen {
            anchors.fill: parent
        }
    }
}

