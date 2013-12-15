function init() {
    var i
    // режиссёры
    var directors = []
    for (i = 0; i < 14; i++) {
        directors.push(qsTr("Режиссёр " + i + 1))
    }
    // актёры
    var actors = []
    for (i = 0; i < 28; i++) {
        actors.push(qsTr("Актёр " + i + 1))
    }
    // эпизоды
    var episopes = []
    for (i = 0; i < 49; i++) {
        episopes.push(qsTr("Эпизод " + i + 1))
    }
    // эпизоды
    var equipments = []
    for (i = 0; i < 49; i++) {
        equipments.push(qsTr("Оборудование " + i + 1))
    }

    return {
        system: {
            version: 1
        },
        const: {
            opponents: [
                qsTr("Трус"),
                qsTr("Балбес"),
                qsTr("Бывалый")
            ],
            genres: [
                qsTr("Фантастика"),
                qsTr("Ужасы"),
                qsTr("Драма"),
                qsTr("Боевик"),
                qsTr("Приключения"),
                qsTr("Комедия"),
                qsTr("Мюзикл")
            ],
            directors: directors,
            actors: actors,
            eposodes: episopes,
            equipments: equipments

        },
        text: {
            phases: {
                genre: [
                    qsTr("Бросьте игральную кость"),
                    qsTr("Перетащите выбранный вами жанр в руку игрока"),
                    qsTr("Сбросьте в мусор любой из оставшихся жанров"),
                    qsTr("Передайте ход")
                ]
                ,
                second: []
            }
        },
        variable: {

        }
    }
}

function load() {

}

function save() {

}
