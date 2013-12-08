import QtQuick 2.1
import "users"
import "cards"

Rectangle {
    Row {
        x: 10
        y: 10
        spacing: 17
        Opponent {

        }

        Opponent {

        }

        Opponent {

        }
    }

    Gamer {
        x: 485
        y: 10
    }

    Deck {
        x: 10
        y: 260

    }

    Grid {
        x: 233
        y: 270
        columns: 3
        columnSpacing: 15
        rowSpacing: 10

        Card {

        }

        Card {

        }

        Card {

        }

        Card {

        }

        Card {

        }

        Card {

        }
    }
}
