import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"
Rectangle {
    color: "#282442"
    NavBar_Custom{
        navText: currentPlayer + " your Turn"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }

    // T|D :: M|F :: Age :: Mode :: [Options-Preferences] :: Points ::

    Component.onCompleted: {
        //alle daten aus der tabelle raus
        //random neuer spieler
        //tad_auswahl(player, T|D)
    }
}
