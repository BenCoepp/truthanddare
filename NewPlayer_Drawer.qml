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
    background: Rectangle{
        anchors.fill: parent
        color: "#282442"
    }

    property var moreInfoA: false

    onClosed: {
        playerName_Input.clear()
        playerAge_Input.value = 16
        if(moreInfoA === true){
            drawerRoot.height = drawerRoot.height/2
            moreLabel.text = "More Info"
            moreInfoA = false
            optionsListView.visible = false
        }
    }

    Label{
        id: titelLabel
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "New Player"
        color: "white"
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
        Rectangle{
            anchors.fill: parent
            radius: 100
            color: "#282442"
            border.color: "#fc5b19"
            border.width: 2
            antialiasing: true

            Image {
                id: openButtonIcon
                anchors.centerIn: parent
                width: parent.width-6
                height: parent.height-6
                antialiasing: true
                source: "qrc:/Assetes/Icons/delete_icon.png"
            }
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
    ListView{
        id: optionsListView
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width-20
        visible: false
        height: parent.height/2-50
        model: ListModel{
            ListElement{
                titel: "Bandage"
                value: "bandages"
                minAge: 18
                gender: "Male"
            }
            ListElement{
                titel: "Dildo"
                value: "dildo"
                minAge: 18
                gender: "Male"
            }
            ListElement{
                titel: "Strapon"
                value: "strapon"
                minAge: 18
                gender: "Male"
            }
            ListElement{
                titel: "Bandage"
                value: "bandages"
                minAge: 18
                gender: "Female"
            }
            ListElement{
                titel: "Dildo"
                value: "dildo"
                minAge: 18
                gender: "Female"
            }
            ListElement{
                titel: "Strapon"
                value: "strapon"
                minAge: 18
                gender: "Female"
            }
            ListElement{
                titel: "Feet-Fetish"
                value: "feet"
                minAge: 18
                gender: "Male"
            }
            ListElement{
                titel: "Kissing"
                value: "kissing"
                minAge: 16
                gender: "Male"
            }
            ListElement{
                titel: "Kissing"
                value: "kissing"
                minAge: 16
                gender: "Female"
            }
        }
        delegate: Item {
            width: parent.width
            height: 50
            visible: if(
                    playerAge_Input.value >= minAge &&
                    playerGender_Input.currentText === gender
                    ){true}else{false}
            CheckBox{
                anchors.verticalCenter: parent.verticalCenter
                text: titel
                onCheckedChanged: {
                    function find(model, criteria) {
                      for(var i = 0; i < model.count; ++i) if (criteria(model.get(i))) return model.get(i)
                      return null
                    }
                    if(this.checked === true){
                        playerTagModel.append({"value": value,
                                                "titel": titel,
                                                "icon": "qrc:/Assetes/Icons/user_icon.png"
                                              })
                    }else{
                        playerTagModel.remove(find(playerTagModel, function(item) { return item.name === value }))
                    }
                }
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
            color: "white"
        }
        onClicked: {
            if(moreInfoA === false){
                drawerRoot.height = drawerRoot.height*2
                moreLabel.text = "Less Info"
                moreInfoA = true
                optionsListView.visible = true
            }else{
                drawerRoot.height = drawerRoot.height/2
                moreLabel.text = "More Info"
                moreInfoA = false
                optionsListView.visible = false
            }
        }
    }
    ListModel{
        id: playerTagModel
        onCountChanged: {
            for(var i= 0; i < this.count; i++){
                console.log(this.get(i).value + "  " + i)
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
                "playerGender": playerGender_Input.currentText,
                "playerTagData": playerTagModel
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
