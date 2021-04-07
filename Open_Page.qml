import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "qrc:/Components"

Rectangle{
    color: "#2C3E50"

    ColumnLayout{
        anchors.fill: parent

        Button_Custom{
            buttonTitel: "New Games"
            buttonSubTitel: "Standard Truth & Dare Game"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                contentFrame.replace("qrc:/Game/NewGame_Page.qml")
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
                contentFrame.replace("qrc:/Add_TAD/AddTAD_Page.qml")
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
