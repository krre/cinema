import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

Item {
    id: producerScreen
    anchors.fill: parent
    anchors.centerIn: parent
    Button {
        anchors.centerIn: parent
        text: qsTr("Вернуться в начало")
        style: buttonStyle
        onClicked: main.screenMode = "start"
    }
    property Component buttonStyle: ButtonStyle {
        background: Rectangle {
            implicitHeight: 70
            implicitWidth: 500
            color: control.pressed ? "darkGray" : control.activeFocus ? "#cdd" : "#ccc"
            antialiasing: true
            border.color: "gray"
            radius: 10
        }
        label: Text {
            text: control.text
            font.pixelSize: 25
            color: "steelblue"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }
    }
}
