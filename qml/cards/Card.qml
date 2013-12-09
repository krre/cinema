import QtQuick 2.0

Item {
    id: root
    property alias text: label.text

    signal pressed

    width: 93
    height: 158

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: tile
        onReleased: parent = tile.Drag.target !== null ? tile.Drag.target : root
        onPressed: root.pressed()

        Rectangle {
            id: tile
            width: root.width
            height: root.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#c3beff"
            border.color: "black"
            border.width: 3

            Drag.active: mouseArea.drag.active

            Text {
                id: label
                anchors.centerIn: parent
                font.pointSize: 15
            }

            states: State {
                when: mouseArea.drag.active
                ParentChange { target: tile; parent: root }
                AnchorChanges { target: tile; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
            }
        }
    }


}
