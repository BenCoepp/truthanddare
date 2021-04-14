import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import "qrc:/Components"

Rectangle{
    color: "#282442"
    ObjectModel{
        id: openPageModel
        ColumnLayout{
            width: parent.width
            spacing: 20
            Button_Custom{
                buttonTitel: "New Games"
                buttonSubTitel: "Standard Truth & Dare Game"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    contentFrame.replace("qrc:/Game/NewGame_Page.qml")
                }
            }
            Button_Custom{
                buttonTitel: "Online Game"
                buttonSubTitel: "Join and or Create a Room for Online Game"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    contentFrame.replace("qrc:/Room_Page/RoomMAIN_Page.qml")
                }
            }
            Button_Custom{
                buttonTitel: "Add New"
                buttonSubTitel: "Add New Truth & Dares to Your Games or Online"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    contentFrame.replace("qrc:/Add_TAD/AddTAD_Page.qml")
                }
            }
            Button_Custom{
                buttonTitel: "Settings"
                buttonSubTitel: "Customize the App, and manage your Settings"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    contentFrame.replace("qrc:/Settings_Page/Settings_Page.qml")
                }
            }
            Button_Custom{
                buttonTitel: "Statistics"
                buttonSubTitel: "See your Game Statistics and some genreral ones"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    contentFrame.replace("qrc:/Add_TAD/AddTAD_Page.qml")
                }
            }
        }
    }
    ListView {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height-40
        model: openPageModel
        spacing: 20
    }
}
