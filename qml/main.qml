import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    width: 800
    height: 480
    Rectangle {
        property int buttonHeight: 50
        id: container
        width: 500
        height: parent.height
        anchors.centerIn: parent
        //color: "blue"
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10
            Button {
                text: "ИГРА"
                style: buttonStyle
                onClicked: console.log("click")
            }
            Button {
                text: "ПРОДЮСЕР"
                style: buttonStyle
                onClicked: console.log("click")
            }
            Button {
                text: "АРХИВ"
                style: buttonStyle
                onClicked: console.log("click")
            }
            Button {
                text: "ВЫХОД"
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
            font.pixelSize: 22
            color: "steelblue"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
