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
        Settings_Item{
            anchors.horizontalCenter: parent.horizontalCenter
            titel: "Age"
            value: 20
            optionType: "int"
        }
        Settings_Item{
            anchors.horizontalCenter: parent.horizontalCenter
            titel: "Notification"
            value: "All"
            optionType: "select"
            optionModel: ListModel {
                ListElement { text: "All" }
                ListElement { text: "Only Nessesary" }
                ListElement { text: "None" }
            }
        }
        Settings_Item{
            anchors.horizontalCenter: parent.horizontalCenter
            titel: "Use Statistics"
            value: "All"
            optionType: "select"
            optionModel: ListModel {
                ListElement { text: "All" }
                ListElement { text: "Only Nesseary" }
                ListElement { text: "None" }
            }
        }
        Settings_Item{
            anchors.horizontalCenter: parent.horizontalCenter
            titel: "Color Shema"
            value: "Default"
            optionType: "color"
        }
    }
    ListView {
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height-50
        model: settingsPageModel
        spacing: 20
        footer: Item {
            width: parent.width
            height: 50

        }
    }
}
