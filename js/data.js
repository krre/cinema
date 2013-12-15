function init() {
    return {
        system: {
            version: 1
        },
        const: {
            genres: [
                qsTr("Фантастика"),
                qsTr("Ужасы"),
                qsTr("Драма"),
                qsTr("Боевик"),
                qsTr("Приключения"),
                qsTr("Комедия"),
                qsTr("Мюзикл")
            ],
            opponents: [
                qsTr("Трус"),
                qsTr("Балбес"),
                qsTr("Бывалый")
            ]
        },
        text: {
            phases: {
                first: [
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
