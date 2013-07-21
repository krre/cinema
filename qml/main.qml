import QtQuick 2.1
Item {
    id: main
    property string screenMode: "start"
    width: 800
    height: 480
    StartScreen {
        visible: screenMode === "start"
    }
    ProducerScreen {
        visible: screenMode === "producer"
    }
    GameScreen {
        visible: screenMode === "game"
    }
}
