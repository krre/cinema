import QtQuick 2.2
import "users"
import "cards"
import "../js/phase.js" as Phase
import "../js/utils.js" as Utils

Rectangle {
    property int rndDice: 0
    property var genres: Phase.emptyGenreList()
    property int zStack: 100
    property int genreIndex: -1
    property int stateNumber: 0

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
            id: cards
            model: 6

            Card {
                text: genres[modelData]
                visible: rndDice > modelData
                onPressed: z = ++zStack
                onFallToSlot: genreIndex = Phase.genreIndexByName(text)
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

        Text {
            width: parent.width - 30
            anchors.centerIn: parent
            text: globalData.text.phases.first[stateNumber]
            font.pointSize: 18
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
        }

    }

    Column {
        x: 567
        y: 281
        spacing: 34

        // кнопка игральная кость
        Image {
            source: "images/dice_action.png"
            opacity: diceMouseArea.pressed ? 0.5 : 1

            MouseArea {
                id: diceMouseArea
                anchors.fill: parent
                onClicked:  {
                    rndDice = Utils.rndInt(1, 6)
                    genres = Phase.getRndGenreList(rndDice)
                    for (var i = 0; i < cards.count; i++) {
                        cards.itemAt(i).tile.opacity = 1
                    }
                    stateNumber = 1
                }
            }
        }

        // кнопка фортуна
        Image {
            source: "images/fortune_action.png"
            opacity: fortuneMouseArea.pressed ? 0.5 : 1

            MouseArea {
                id: fortuneMouseArea
                anchors.fill: parent
                onClicked:  {
                    console.log("fortune")
                }
            }
        }

        // кнопка переход хода
        Image {
            source: "images/next_action.png"
            opacity: nextMouseArea.pressed ? 0.5 : 1

            MouseArea {
                id: nextMouseArea
                anchors.fill: parent
                onClicked:  {
                    console.log("next")
                }
            }
        }
    }

    Rectangle {
        color: "#0e143e"
        width: parent.width
        height: 448
        anchors.bottom: parent.bottom

        Text {
            y: 4
            text: Phase.genreByIndex(genreIndex)
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
        }

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

            Image {
                source: "images/tool-area.png"
            }

            Image {
                source: "images/recycle-area.png"
            }

            Image {
                source: "images/fortune-area.png"
                Text {
                    y: 13
                    width: parent.width
                    text: qsTr("Фортуна игрока")
                    font.pointSize: 17
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter

                }

                Text {
                    x: 60
                    y: 75
                    text: "0"
                    font.pointSize: 30
                }

                Text {
                    x: 60
                    y: 115
                    text: "0"
                    font.pointSize: 30
                }
            }
        }

        DropArea {
            id: dropTarget
            anchors.fill: parent

            Rectangle {
                id: dropRectangle
                anchors.fill: parent
                color: "#ff0800"
                opacity: dropTarget.containsDrag ? 0.5 : 0
            }
        }
    }
}
