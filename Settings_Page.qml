import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"
import Firebase 1.0
Rectangle{
    color: "#282442"

    NavBar_Custom{
        navText: "Settings"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
    Firebase{
        id: firebase
    }

    ObjectModel{
        id: settingsPageModel

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 50
            Label{
                anchors.centerIn: parent
                text: "Profile"
                font.bold: true
                font.pointSize: 25
                color: "white"
            }
        }
        Item{
            id: accountSettingsItem
            visible: false
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
        }

        Button{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "LogIn or SignUp"
            onClicked: {
                firebase.dbsetAPIKey("AIzaSyB1s5mVGCw7sLcv3TkkzHJP20viEL390FY")
                firebase.dbsignUserIn("ben.coeppicus@gmail.com", "elfenlied6")
            }
        }

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 50
            Label{
                anchors.centerIn: parent
                text: "Generall"
                font.bold: true
                font.pointSize: 25
                color: "white"
            }
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
        footerPositioning: ListView.OverlayFooter
        footer: MouseArea {
            width: parent.width
            height: 50
            Rectangle{
                anchors.fill: parent
                color: "green"
            }

            Label{
                anchors.centerIn: parent
                text: "Save"
            }
        }
    }
}
