import QtQuick 2.15
import QtQuick.Controls 2.15

MouseArea{
    id: publicTruthAndDareMouseArea
    width: parent.width
    height: parent.height/2-50

    property var titelText: "Your Truth & Dares"
    property var titelColor: "white"
    property var discText: "Your Truth & Dares"
    property var discColor: "white"

    Rectangle{
        anchors.fill: parent
        color: "#2c3e50"
    }
    Rectangle{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height*0.45

        Label{
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: titelText
        }
        Label{
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width-20
            text: discText
        }
    }
}
