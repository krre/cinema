function Gamer(name) {
    this.name = name
    this.score = 0
    this.audience = 0
    this.genre = 0
    this.moneys = []

    this.cards = {
        directors: [],
        actors: [],
        episodes: [],
        equipments: [],
        count: function() {
            var sum = 0
            for (var deck in this) {
                sum += this[deck].length
            }
            return sum
        }
    }

    if (!this.moneys.length) {
        this.moneys = [1, 3, 5]
    }

    if (!this.cards.count()) {
        //this.cards.equipments =
        //console.log(this.cards.count())

    }
}
