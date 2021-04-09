import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"
Rectangle{
    color: "#282442"

    NavBar_Custom{
        navText: "Settings"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }

    ObjectModel{
        id: settingsPageModel
        Settings_Item{
            anchors.horizontalCenter: parent.horizontalCenter
            titel: "Your Name"
            value: "John Doe"
            optionType: "string"
        }
    }
    ListView {
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height-50
        model: settingsPageModel
        spacing: 20
    }
}
