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
            ]
        },
        text: {
            phases: {
                first: [
                    qsTr("Бросьте игральную кость"),
                    qsTr("Перетащите выбранный вами жанр в руку игрока"),
                    qsTr("Сбросьте в музор любой из оставшихся жанров")
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
