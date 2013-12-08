.import "utils.js" as Utils

function emptyGenreList() {
    return ["", "", "", "", "", ""]
}

function genreList() {
    return [
                qsTr("Фантаст."),
                qsTr("Комедия"),
                qsTr("Драма"),
                qsTr("Ужасы"),
                qsTr("Мюзикл"),
                qsTr("Боевик"),
                qsTr("Триллер")
            ]
}

function getRndGenreList(number) {
    var genres = genreList()
    var rndGenres = emptyGenreList()
    for (var i = number - 1, j = 0, k = genres.length - 1; i >= 0; i--, j++, k--) {
        var rndPos = Utils.rndInt(0, k)
        rndGenres[j] = genres[rndPos]
        genres.splice(rndPos, 1)
    }

    return rndGenres
}
