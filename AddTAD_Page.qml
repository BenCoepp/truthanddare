import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"

Rectangle {

    property date today: new Date()
    NavBar_Custom{
        navText: "Add New"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
    Rectangle{
        id: backRectangel
        height: 50
        width: parent.width
        color: "#2c3e50"
        MouseArea{
            height: parent.height
            width: 50
            onClicked: {
                contentFrame.replace("qrc:/Game/Open_Page.qml")
            }
            Image {
                anchors.centerIn: parent
                width: 30
                height: 35
                rotation: 90
                antialiasing: true
                source: "qrc:/Assetes/Icons/Expand Arrow icon.png"
            }
        }
    }

    AddNew_Button{
        id: publicTruthAndDareMouseArea
        anchors.top: parent.top
        anchors.topMargin: 50
        onClicked: {
            this.height = parent.height-50
            this.enabled = false
            yourTruthAndDareMouseArea.visible = false
        }
    }
    AddNew_Button{
        id: yourTruthAndDareMouseArea
        anchors.bottom: parent.bottom
        onClicked: {
            backRectangel.color = "#fe9000"
            this.height = parent.height-50
            this.enabled = false
            publicTruthAndDareMouseArea.visible = false
            yourTruthAndDare_Page.visible = true
            yourTruthAndDareTitel.visible = false
        }
    }

    YourTruthAndDares_Page{
        id: yourTruthAndDare_Page
        visible: false
    }
}
