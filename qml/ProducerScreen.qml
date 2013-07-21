import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

Item {
    id: producerScreen
    anchors.fill: parent
    anchors.centerIn: parent

    Column {
        id: container
        width: 700
        spacing: 10
        anchors.centerIn: parent

        Button {
            text: qsTr("Введите ваше имя")
            style: buttonStyle
            onClicked: console.log("click")
        }

        Button {
            text: qsTr("Введите вашу склонность к жанру кино")
            //text: qsTr("Используйте $exp очков опыта для прокачки Skills")
            style: buttonStyle
            onClicked: console.log("click")
        }

        Button {
            text: qsTr("Введите ваш девиз")
            style: buttonStyle
            onClicked: console.log("click")
        }

        RowLayout {
            id: rowlayout1
            width: parent.width

            Button {
                id: buttonAvatar
                implicitWidth: 150
                implicitHeight: 150
                text: qsTr("Добавьте вашу фотографию или аватар")
                style: buttonStyle
                onClicked: console.log("click")
            }

            Text {
                text: qsTr("СТАТИСТИКА<br>
                        Репутация<br>
                        Зрительская аудитория<br>
                        Кассовые сборы<br>
                        Бонус к жанру")
                        anchors.left: buttonAvatar.right
                        anchors.right: buttonNext.left
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 15
            }

            Button {
                id: buttonNext
                implicitWidth: 80
                implicitHeight: 80
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                text: qsTr("Далее")
                style: buttonStyle
                onClicked: main.screenMode = "game"
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
            font.pixelSize: 25
            color: "steelblue"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }
    }
}


