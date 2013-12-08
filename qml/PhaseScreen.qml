import QtQuick 2.1
import "users"
import "cards"
import "action-buttons"

Rectangle {
    property int rndDice: 0
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
        text: "Жанр"
    }

    Grid {
        x: 233
        y: 270
        columns: 3
        columnSpacing: 15
        rowSpacing: 10

        Card {
            visible: rndDice > 0

        }

        Card {
            visible: rndDice > 1

        }

        Card {
            visible: rndDice > 2

        }

        Card {
            visible: rndDice > 3

        }

        Card {
            visible: rndDice > 4

        }

        Card {
            visible: rndDice > 5

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
            onClicked: rndDice = Math.round(Math.random() * (6 - 1) + 1)
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
    }
}
