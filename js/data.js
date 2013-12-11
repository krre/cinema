function init() {
    return {
        system: {
            version: 1
        },
        const: {
            genres: [
                qsTr("Фантастика"),
                qsTr("Комедия"),
                qsTr("Драма"),
                qsTr("Ужасы"),
                qsTr("Мюзикл"),
                qsTr("Боевик"),
                qsTr("Триллер")
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
