import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.12

Drawer {
    id: drawerRoot
    width: parent.width
    height: parent.height/2
    edge: Qt.BottomEdge
    interactive: false

    property var moreInfoA: false


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
        placeholderText: qsTr("Gender")
    }
    MouseArea{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width-10
        height: 20

        Label{
            id: moreLabel
            anchors.centerIn: parent
            text: "More Info"
        }
        onClicked: {
            if(moreInfoA === false){
                drawerRoot.height = drawerRoot.height*2
                moreLabel.text = "Less Info"
                moreInfoA = true
            }else{
                drawerRoot.height = drawerRoot.height/2
                moreLabel.text = "More Info"
                moreInfoA = false
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:360;width:360}
}
##^##*/
