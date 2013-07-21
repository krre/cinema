import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    id: startScreen
    anchors.fill: parent
    anchors.centerIn: parent
    Item {
        id: container
        width: 500
        height: parent.height
        anchors.centerIn: parent
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10
            Button {
                text: qsTr("ИГРА")
                style: buttonStyle
                onClicked: main.screenMode = "game"
            }
            Button {
                text: qsTr("ПРОДЮСЕР")
                style: buttonStyle
                onClicked: main.screenMode = "producer"
            }
            Button {
                text: qsTr("АРХИВ")
                style: buttonStyle
                onClicked: console.log("click")
            }
            Button {
                text: qsTr("ВЫХОД")
                style: buttonStyle
                onClicked: Qt.quit()
            }
        }
    }

    property Component buttonStyle: ButtonStyle {
        background: Rectangle {
            implicitHeight: 70
            implicitWidth: container.width
            color: control.pressed ? "darkGray" : control.activeFocus ? "#cdd" : "#ccc"
            antialiasing: true
            border.color: "gray"
            radius: 10
        }
        label: Text {
            text: control.text
            font.pixelSize: 35
            color: "steelblue"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
