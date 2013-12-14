function rndInt(min, max) {
    return Math.round(Math.random() * (max - min) + min)
}

function msgbox(msg) {
    Qt.createQmlObject('import QtQuick 2.2; \
       import QtQuick.Dialogs 1.1; \
       MessageDialog {
        visible: true;
        text: "' + msg + '"}', root)
}
