import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtMultimedia 5.12
import "qrc:/Components"

Rectangle {
    color: "#282442"
    NavBar_Custom{
        id: navbar
        navText: "Join or Create Room"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Room_Page/RoomMAIN_Page.qml")
        }
    }
}
