.import "utils.js" as Utils

function emptyGenreList() {
    return ["", "", "", "", "", ""]
}

function genreList() {
    return [
                qsTr("Фантаст."),
                qsTr("Боевик"),
                qsTr("Драма"),
                qsTr("Триллер"),
                qsTr("Комедия"),
                qsTr("Историч.")
            ]
}

function getRndGenreList(number) {
    var genres = genreList()
    var rndGenres = emptyGenreList()
    for (var i = number - 1, j = 0, k = 5; i >= 0; i--, j++, k--) {
        var rndPos = Utils.rndInt(0, k)
        rndGenres[j] = genres[rndPos]
        genres.splice(rndPos, 1)
    }

    return rndGenres
}
