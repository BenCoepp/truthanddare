import QtQuick 2.15
import QtQuick.Controls 2.15

RoundButton {
    id: root
    signal button1Clicked()
    signal button2Clicked()
    signal button3Clicked()
    property var isOpen: false

    property var button1Icon: ""
    property var button2Icon: ""
    property var button3Icon: ""
    Rectangle{
        anchors.centerIn: parent
        width: 35
        height: 35
        radius: 100
        color: "#282442"
        border.color: "#fc5b19"
        border.width: 2

        Image {
            id: openButtonIcon
            anchors.centerIn: parent
            width: parent.width-6
            height: parent.height-6
            antialiasing: true
            source: "qrc:/Assetes/Icons/plus_icon.png"
        }
    }
    onClicked: {
        if(isOpen === false){
            button1.visible = true
            button2.visible = true
            button3.visible = true
            openButtonIcon.source = "qrc:/Assetes/Icons/delete_icon.png"
            isOpen = true
        }else{
            button1.visible = false
            button2.visible = false
            button3.visible = false
            openButtonIcon.source = "qrc:/Assetes/Icons/plus_icon.png"
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
        Rectangle{
            anchors.centerIn: parent
            width: 35
            height: 35
            radius: 100
            color: "#282442"
            border.color: "#fc5b19"
            border.width: 2

            Image {
                anchors.centerIn: parent
                width: parent.width-6
                height: parent.height-6
                antialiasing: true
                source: "qrc:/Assetes/Icons/plus_icon.png"
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
            anchors.centerIn: parent
            width: 35
            height: 35
            radius: 100
            color: "#282442"
            border.color: "#fc5b19"
            border.width: 2

            Image {
                anchors.centerIn: parent
                width: parent.width-6
                height: parent.height-6
                antialiasing: true
                source: "qrc:/Assetes/Icons/plus_icon.png"
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
            anchors.centerIn: parent
            width: 35
            height: 35
            radius: 100
            color: "#282442"
            border.color: "#fc5b19"
            border.width: 2

            Image {
                anchors.centerIn: parent
                width: parent.width-6
                height: parent.height-6
                antialiasing: true
                source: "qrc:/Assetes/Icons/plus_icon.png"
            }
        }
    }
}
