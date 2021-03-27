import QtQuick 2.15
import QtQuick.Controls 2.15

RoundButton {
    id: root
    text: "+"
    signal button1Clicked()
    signal button2Clicked()
    signal button3Clicked()
    property var isOpen: false

    property var button1Icon: ""
    property var button2Icon: ""
    property var button3Icon: ""

    onClicked: {
        if(isOpen === false){
            button1.visible = true
            button2.visible = true
            button3.visible = true
            isOpen = true
        }else{
            button1.visible = false
            button2.visible = false
            button3.visible = false
            isOpen = false
        }
    }
    RoundButton{
        id: button1
        anchors.bottom: parent.top
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        width: parent.width
        height: parent.height
        onClicked: button1Clicked()
        background: Rectangle{
            anchors.fill: parent
            radius: 100

            Image {
                anchors.centerIn: parent
                width: parent.width-2
                height: parent.height-2
                antialiasing: true
                source: button1Icon
            }
        }
    }
    RoundButton{
        id: button2
        anchors.bottom: button1.top
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        onClicked: button2Clicked()
        Rectangle{
            anchors.fill: parent
            radius: 100

            Image {
                anchors.centerIn: parent
                width: parent.width-2
                height: parent.height-2
                antialiasing: true
                source: button2Icon
            }
        }
    }
    RoundButton{
        id: button3
        anchors.bottom: button2.top
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        onClicked: button3Clicked()
        Rectangle{
            anchors.fill: parent
            radius: 100

            Image {
                anchors.centerIn: parent
                width: parent.width-2
                height: parent.height-2
                antialiasing: true
                source: button3Icon
            }
        }
    }
}
