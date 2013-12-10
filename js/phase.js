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

function genreByIndex(index) {
    if (index >= 0) {
        var genres = genreList()
        return genres[index]
    }
    else {
        return ""
    }
}

function genreIndexByName(name) {
    var genres = genreList()
    for (var i = 0; i < genres.length; i++) {
        console.log(genres[i] + " " + name)
        if (genres[i] == name) {
            return i
        }
    }

    return -1
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
