import QtQuick 2.0
import "samegame.js" as SameGame

Rectangle {
    id: screen

    width: 490; height: 720

    SystemPalette { id: activePalette }

    Item {
        width: parent.width
        anchors { top: parent.top; bottom: toolBar.top }

        Image {
            id: background
            anchors.fill: parent
            source: "../Desktop/window.png"
            fillMode: Image.PreserveAspectCrop
        }

        Item {
            id: gameCanvas

            property int score: 0
            property int blockSize: 40

            width: parent.width - (parent.width % blockSize)
            height: parent.height - (parent.height % blockSize)
            anchors.centerIn: parent

            MouseArea {
                anchors.fill: parent
                onClicked: SameGame.handleClick(mouse.x, mouse.y)
            }
        }
    }

    Dialog {
        id: dialog
        anchors.centerIn: parent

        z: 100
    }

    Rectangle {
        id: toolBar
        width: parent.width; height: 30
        color: activePalette.window
        anchors.bottom: screen.bottom

        Button {
            anchors { left: parent.left; verticalCenter: parent.verticalCenter }
            text: "New Game"
            onClicked: SameGame.startNewGame()
        }

        Text {
            id: score
            anchors { right: parent.right; verticalCenter: parent.verticalCenter }
            text: "Score: Who knows?"
            color: "blue"
            font.family: "Helvetica"
            font.pixelSize: 28

        }
    }
}
