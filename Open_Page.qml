import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    color: "#2C3E50"

    MouseArea{
        width: parent.width
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150

        Label{
            anchors.centerIn: parent
            text: "New Game"
        }

        onClicked: {
            contentFrame.replace("qrc:/Game/NewGame_Page.qml")
        }
    }
}
