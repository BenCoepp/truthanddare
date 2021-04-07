import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

import "qrc:/Components"
Drawer {
    id: drawerRoot
    width: parent.width
    height: parent.height/2
    edge: Qt.BottomEdge
    interactive: false

    property var moreInfoA: false

    onClosed: {
        playerName_Input.clear()
        playerAge_Input.value = 16
        if(moreInfoA === true){
            drawerRoot.height = drawerRoot.height/2
            moreLabel.text = "More Info"
            moreInfoA = false
            moreInfoBox.visible = false
        }
    }

    Label{
        id: titelLabel
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "New Player"
        font.pointSize: 15
        font.bold: true
    }
    RoundButton{
        anchors.top: parent.top
        anchors.topMargin: -15
        anchors.right: parent.right
        anchors.rightMargin: 10
        onClicked: {
            newPlayer_drawer.close()
        }
    }

    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: titelLabel.height+10
        width: drawerRoot.width
        height: drawerRoot.height/2-50
        spacing: 10
        TextField{
            id: playerName_Input
            Layout.alignment: Qt.AlignHCenter
            placeholderText: "Player Name..."
            Layout.minimumWidth: parent.width-10
            Layout.minimumHeight: 30
            onTextChanged: {
                if(this.text !== ""){
                    submitButton.enabled = true
                }else{
                    submitButton.enabled = false
                }
            }
        }
        ComboBox {
            id: playerGender_Input
            Layout.alignment: Qt.AlignHCenter
            model: [ "Male", "Female", "Other" ]
            Layout.minimumWidth: parent.width-10
            Layout.minimumHeight: 30
        }
        SpinBox {
            id: playerAge_Input
            Layout.alignment: Qt.AlignHCenter
            Layout.minimumWidth: parent.width-10
            Layout.minimumHeight: 30
            value: 16
            from: 6
            to: 99
        }
    }

    ColumnLayout {
        id: moreInfoBox
        visible: false
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        width: parent.width
        height: parent.height/2
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
        CheckBox {
            checked: true
            text: qsTr("First")
        }
        CheckBox {
            text: qsTr("Second")
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
    Button{
        id: submitButton
        anchors.bottom: parent.bottom
        width: parent.width
        height: 50
        enabled: false
        text: "Submit"
        onClicked: {
            newPlayerListModel.append({
                "playerName": playerName_Input.text,
                "playerAge": playerAge_Input.value,
                "playerGender": playerGender_Input.currentText
            })
            newPlayer_drawer.close()
        }
    }
}

/*##^##
Designer {
    D{i:0;height:360;width:360}
}
##^##*/
