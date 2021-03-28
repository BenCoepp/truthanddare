import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
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
        width: 200
        height: 30
        placeholderText: qsTr("Player Name...")
    }
    ComboBox {
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 10
        width: 200
        height: 30
        model: [ "Male", "Female", "Other" ]
    }
    SpinBox {
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: 10
        width: 200
        height: 30
        value: 16
        from: 6
        to: 99
    }
    Item {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        width: parent.width
        height: parent.height/2

        ColumnLayout {
            id: moreInfoBox
            visible: false
            anchors.left: parent.left
            anchors.leftMargin: 10
            CheckBox {
                checked: true
                text: qsTr("First")
            }
            CheckBox {
                text: qsTr("Second")
            }
            CheckBox {
                checked: true
                text: qsTr("Third")
            }
        }
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
                moreInfoBox.visible = true
            }else{
                drawerRoot.height = drawerRoot.height/2
                moreLabel.text = "More Info"
                moreInfoA = false
                moreInfoBox.visible = false
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:360;width:360}
}
##^##*/
