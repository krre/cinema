import QtQuick 2.1
import "users"
import "cards"
import "action-buttons"
import "../js/phase.js" as Phase
import "../js/utils.js" as Utils

Rectangle {
    property int rndDice: 0
    property var genres: Phase.emptyGenreList()
    property int zStack: 100

    Row {
        x: 10
        y: 10
        spacing: 17
        Opponent {
            color: "#e3e3e3"
        }

        Opponent {
            color: "#f2ffbd"
        }

        Opponent {
            color: "#ffcaeb"
        }
    }

    Gamer {
        x: 485
        y: 10
    }

    Deck {
        x: 10
        y: 260
        text: qsTr("Жанр")
    }

    Grid {
        x: 233
        y: 270
        z: 100
        columns: 3
        columnSpacing: 15
        rowSpacing: 10

        Repeater {
            model: 6

            Card {
                text: genres[modelData]
                visible: rndDice > modelData
                onPressed: z = ++zStack
            }
        }
    }

    Rectangle {
        id: description
        x: 0
        y: 610
        width: 553
        height: 225
        color: "#e2dfff"
    }

    Column {
        x: 567
        y: 281
        spacing: 34

        Tool {
            color: "#fff000"
            text: rndDice
            onClicked: {
                rndDice = Utils.rndInt(1, 6)
                genres = Phase.getRndGenreList(rndDice)
            }
        }

        Tool {
            color: "#00fff0"

        }

        Tool {
            color: "#ff3a3a"

        }
    }

    Rectangle {
        color: "#767399"
        width: parent.width
        height: 448
        anchors.bottom: parent.bottom

        Flow {
            x: 3
            y: 43
            width: 620
            height: 420
            spacing: 3

            Repeater {
                model: 10
                Slot {

                }
            }
        }

        Column {
            x: 613
            y: 10
            spacing: 22

            Rectangle {
                width: 100
                height: 97
                color: "#aca9cc"
            }

            Rectangle {
                width: 100
                height: 97
                color: "#aca9cc"
            }

            Rectangle {
                width: 100
                height: 174
                color: "#00fff0"
                border.color: "black"
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "#22ff05"
            opacity: mouseArea.containsMouse ? 0.5 : 0

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onEntered: opacity

            }
        }
    }
}
