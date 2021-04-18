import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"

Rectangle {
    color: "#282442"
    Canvas{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height-50
        antialiasing: true
        onPaint:{
            var context = getContext("2d");
            // the triangle
            context.beginPath()
            context.moveTo(0, 0)
            context.lineTo(parent.width, 0)
            context.lineTo(parent.width, parent.height/2-50)
            context.lineTo(0, parent.height/2)
            context.closePath()
            // the fill color
            context.fillStyle = "#282442"
            context.fill()
        }
    }
    Canvas{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height-50
        antialiasing: true
        onPaint:{
            var context = getContext("2d");
            // the triangle
            context.beginPath()
            context.moveTo(0, parent.height/2)
            context.lineTo(parent.width, parent.height/2-50)
            context.lineTo(parent.width, parent.height)
            context.lineTo(0, parent.height)
            context.closePath()
            // the fill color
            context.fillStyle = "#fc5b19"
            context.fill()
        }
    }
    Rectangle{
        id: topRecSlider
        anchors.top: parent.top
        anchors.topMargin: 50
        width: parent.width
        height: 0
        color: "#282442"
        PropertyAnimation{
            id: topRecSliderAN
            target: topRecSlider
            property: "height"
            from: 0
            to: parent.height-50
            duration: 500
            onFinished: {
                contentFrame.replace("qrc:/Add_TAD/YourTruthAndDares_Page.qml")
            }
        }
    }
    Rectangle{
        id: bottomRecSlider
        anchors.bottom: parent.bottom
        width: parent.width
        height: 0
        color: "#fc5b19"

        PropertyAnimation{
            id: bottomRecSliderAN
            target: bottomRecSlider
            property: "height"
            from: 0
            to: parent.height-50
            duration: 500
            onFinished: {
                contentFrame.replace("qrc:/Room_Page/CreateRoom_Page.qml")
            }
        }
    }

    MouseArea{
        anchors.top: parent.top
        anchors.topMargin: 50
        width: parent.width
        height: parent.height
        onClicked: {
            topRecSliderAN.start()
        }
        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 100
            text: "Your Truth & Dares"
        }
    }
    MouseArea{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        width: parent.width
        height: parent.height/2-50
        onClicked: {
            bottomRecSliderAN.start()
        }
        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            text: "Online Truth & Dares"
        }
    }
    NavBar_Custom{
        id: navbar
        navText: "Join or Create Room"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
}
