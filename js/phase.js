.import "utils.js" as Utils

function Deck(source, cut) {
    var workList = []

    if (source) {
        var sourceList =  JSON.parse(JSON.stringify(source))
        for (var i = cut - 1, j = 0; i >= 0; i--, j++) {
            var rndPos = Utils.rndInt(0, sourceList.length - 1)
            workList.push(sourceList[rndPos])
            sourceList.splice(rndPos, 1)
        }
    }
    this.remove = function(pos) {
       workList.splice(pos, 1)
    }

    this.count = function() {
        return workList.length
    }
    this.list = workList
}

function emptyGenreList() {
    return ["", "", "", "", "", ""]
}

function genreByIndex(index) {
    if (index >= 0) {
        var genres = gameData.const.genres
        return genres[index]
    }
    else {
        return ""
    }
}

function genreIndexByName(name) {
    var genres = gameData.const.genres
    for (var i = 0; i < genres.length; i++) {
        if (genres[i] == name) {
            return i
        }
    }

    return -1
}

function getRndGenreList(number) {
    var genres = JSON.parse(JSON.stringify(gameData.const.genres))
    var rndGenres = emptyGenreList()
    for (var i = number - 1, j = 0, k = genres.length - 1; i >= 0; i--, j++, k--) {
        var rndPos = Utils.rndInt(0, k)
        rndGenres[j] = genres[rndPos]
        genres.splice(rndPos, 1)
    }

    return rndGenres
}
