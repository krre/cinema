.import "utils.js" as Utils

function emptyGenreList() {
    return ["", "", "", "", "", ""]
}

function genreByIndex(index) {
    if (index >= 0) {
        var genres = globalData.const.genres
        return genres[index]
    }
    else {
        return ""
    }
}

function genreIndexByName(name) {
    var genres = globalData.const.genres
    for (var i = 0; i < genres.length; i++) {
        if (genres[i] == name) {
            return i
        }
    }

    return -1
}

function getRndGenreList(number) {
    var genres = JSON.parse(JSON.stringify(globalData.const.genres))
    var rndGenres = emptyGenreList()
    for (var i = number - 1, j = 0, k = genres.length - 1; i >= 0; i--, j++, k--) {
        var rndPos = Utils.rndInt(0, k)
        rndGenres[j] = genres[rndPos]
        genres.splice(rndPos, 1)
    }

    return rndGenres
}
