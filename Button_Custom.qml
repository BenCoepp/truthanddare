import QtQuick 2.15
import QtQuick.Controls 2.15

MouseArea{
    id: root
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width
    height: 140

    property var buttonTitel: "Button Titel"
    property var titelColor: "#fc5b19"
    property var buttonSubTitel: "Button SubTitel"
    property var subTitelColor: "white"
    property var buttonColor: "#1f344b"
    property var bButtonColor: "#1f344b"

    Rectangle{
        anchors.centerIn: parent
        height: parent.height
        width: parent.width-20
        color: buttonColor
        radius: 5
    }
    Label{
        id: titelLabel
        text: buttonTitel
        font.bold: true
        font.pointSize: 35
        width: parent.width
        height: 50
        color: titelColor
        anchors.left: parent.left
        anchors.leftMargin: 20
    }
    Label{
        anchors.top: parent.top
        anchors.topMargin: titelLabel.height+15
        text: buttonSubTitel
        font.pointSize: 10
        color: subTitelColor
        anchors.left: parent.left
        anchors.leftMargin: 20
    }
    Rectangle{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width-20
        height: 50
        radius: 5
        color: bButtonColor

        Image {
            anchors.centerIn: parent
            width: parent.height-20
            height: parent.height-20
            rotation: -90
            source: "qrc:/Assetes/Icons/Expand Arrow icon.png"
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
