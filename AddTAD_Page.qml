import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {

    property date today: new Date()

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

    MouseArea{
        id: publicTruthAndDareMouseArea
        anchors.top: parent.top
        anchors.topMargin: 50
        width: parent.width
        height: parent.height/2-50

        Rectangle{
            anchors.fill: parent
            color: "#2c3e50"
        }
        Label{
            anchors.centerIn: parent
            text: "Public Truthes & Dares"
        }
        onClicked: {
            this.height = parent.height-50
            this.enabled = false
            yourTruthAndDareMouseArea.visible = false
        }
    }
    MouseArea{
        id: yourTruthAndDareMouseArea
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height/2

        Rectangle{
            anchors.fill: parent
            color: "#fe9000"
        }
        Label{
            id: yourTruthAndDareTitel
            anchors.centerIn: parent
            text: "Your Truthes & Dares"
        }
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
