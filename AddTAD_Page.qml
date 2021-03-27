import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    Rectangle{
        height: 50
        width: parent.width
        color: "#2c3e50"
        MouseArea{
            height: parent.height
            width: 50
            onClicked: {
                contentFrame.replace("qrc:/Game/Open_Page.qml")
            }
        }
    }

    MouseArea{
        anchors.top: parent.top
        anchors.topMargin: 50
        width: parent.width
        height: parent.height/2-50

        Rectangle{
            anchors.fill: parent
            color: "#2c3e50"
        }
    }
    MouseArea{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height/2

        Rectangle{
            anchors.fill: parent
            color: "#fe9000"
        }
    }
}
