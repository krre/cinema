import QtQuick 2.1
import "users"
import "cards"
import "../js/phase.js" as Phase
import "../js/utils.js" as Utils

Rectangle {
    id: root
    property int rndDice: 0
//    property var genres: Phase.emptyGenreList()
    property var genres: new Phase.Deck()
    property int zStack: 100
    property int genreIndex: -1
    property int stateNumber: 0

    Component.onCompleted: {
//        var x = new Phase.Deck(globalData.const.genres, 4)
//        var x = new Phase.Deck()
//        Utils.msgbox(x.list)
    }

    Row {
        x: 10
        y: 10
        spacing: 17
        Opponent {
            color: "#e3e3e3"
            name: qsTr("Игрок 1")
        }

        Opponent {
            color: "#f2ffbd"
            name: qsTr("Игрок 2")
        }

        Opponent {
            color: "#ffcaeb"
            name: qsTr("Игрок 3")
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
                text: genres.list[modelData] ? genres.list[modelData] : ""
                visible: text != ""
                onPressed: z = ++zStack
                keys: "card"
                onFallToSlot: if (root.state == "02-select-genre") {
                                  genreIndex = Phase.genreIndexByName(text)
                                  genres.remove(modelData)
                                  console.log(genres.count)
                                  if (genres.count >= 1) {
                                    root.state = "03-garbage"
                                  }
                                  else {
                                      root.state = "04-ejection-cards"
                                  }
                              }
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
                visible: root.state == "01-dice"
                onClicked:  {
                    rndDice = Utils.rndInt(1, 2)
                    genres = new Phase.Deck(globalData.const.genres, rndDice)
                    // отображение карточек, скрытых в прошлую игру
                    for (var i = 0; i < cards.count; i++) {
                        cards.itemAt(i).tile.opacity = 1
                    }
                    root.state = "02-select-genre"
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
            color: "white"
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

            // рынок
            Image {
                source: "images/market-area.png"
            }

            // корзина
            Image {
                source: "images/recycle-area.png"
                DropArea {
                    id: dropRecycleTarget
                    anchors.fill: parent

                    Rectangle {
                        id: dropRecycleRectangle
                        anchors.fill: parent
                        color: "#ff0800"
                        opacity: dropRecycleTarget.containsDrag ? 0.5 : 0
                    }
                }
            }

            // фортуна
            Image {
                source: "images/fortune-area.png"
                Text {
                    y: 13
                    width: parent.width
                    text: qsTr("Фортуна игрока")
                    font.pointSize: 16
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter

                }

                Text {
                    x: 60
                    y: 75
                    text: "0"
                    font.pointSize: 27
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
            id: dropHandTarget
            anchors.fill: parent
            onDropped: console.log(drop)

            Rectangle {
                id: dropHandRectangle
                anchors.fill: parent
                color: "#ff0800"
                opacity: dropHandTarget.containsDrag ? 0.5 : 0
            }
        }
    }

    states: [
        State {
            name: "01-dice"
            PropertyChanges { target: root; stateNumber: 0 }
        },

        State {
            name: "02-select-genre"
            PropertyChanges { target: root; stateNumber: 1 }
            PropertyChanges { target: dropHandTarget; keys: "card" }
            PropertyChanges { target: dropRecycleTarget; keys: "noCard" }
        },

        State {
            name: "03-garbage"
            PropertyChanges { target: root; stateNumber: 2 }
            PropertyChanges { target: dropHandTarget; keys: "noCard" }
            PropertyChanges { target: dropRecycleTarget; keys: "card" }
        },

        State {
            name: "04-ejection-cards"
            PropertyChanges { target: root; stateNumber: 3 }
            PropertyChanges { }
        },

        State {
            name: "04-next-move"
        }

    ]

    state: "01-dice"
    onStateChanged: console.log(root.state)
}
