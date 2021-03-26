import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/Components"

Rectangle{
    anchors.fill: parent
    color: "#2C3E50"

    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: 100
        width: parent.width
        height: parent.height-100

        Button_Custom{
            id: myButton1
            bgColor: "#D23742"
            btColor: "#18BC9E"
            btText: "New Game"
            onClicked: {
                newGamePopUp.open()
            }
        }
        Button_Custom{
            id: myButton2
            bgColor: "#D23742"
            btColor: "#18BC9E"
            btText: "Add TaD"
        }
        Button_Custom{
            id: myButton3
            bgColor: "#D23742"
            btColor: "#18BC9E"
            btText: "Settings"
        }
    }

    NewGame_PopUp{
        id: newGamePopUp
        visible: false
    }
}
