import QtQuick 2.15
import QtQuick.Controls 2.15

Drawer {
    id: drawerRoot
    width: parent.width
    height: parent.height/2
    edge: Qt.BottomEdge
    interactive: false


    TextField{
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 10
        placeholderText: qsTr("Player Name...")
    }
    TextField{
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 10
        placeholderText: qsTr("Player Name...")
    }
    MouseArea{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width-10
        height: 20

        Label{
            anchors.centerIn: parent
            text: "More Info"
        }
        onClicked: {
            drawerRoot.height = 720
        }
    }
}

/*##^##
Designer {
    D{i:0;height:360;width:360}
}
##^##*/
