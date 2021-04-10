import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Item {
    id: root
    width: parent.width
    height: 70

    property var titel: ""
    property var value: ""
    property var isOpen: false

    property var optionType: "" // select, string, int, color
    property ListModel optionModel: null
    property var stringPlaceholderText: "Placeholder"
    property ListModel colorModel: ListModel{
        ListElement{colorValue: "red"; value: "bgColor"}
        ListElement{colorValue: "red"; value: "hColor"}
        ListElement{colorValue: "red"; value: "textColor"}
        ListElement{colorValue: "red"; value: "acColor"}
    }

    MouseArea{
        anchors.centerIn: parent
        width: parent.width-20
        height: parent.height-20
        onClicked: {
            if(isOpen === false){
                root.height = root.height+50
                editBox.visible = true
                isOpen = true
            }else{
                root.height = root.height-50
                editBox.visible = false
                isOpen = false
            }
        }

        Rectangle{
            id: background
            anchors.fill: parent
            radius: 5
            Item {
                width: parent.width
                height: 50
                Item{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.width/2
                    height: parent.height

                    Image {
                        id: iconOption
                        anchors.verticalCenter: parent.verticalCenter
                        width: 30
                        height: 30
                        antialiasing: true
                        source: "qrc:/Assetes/Icons/plus_icon.png"
                    }
                    Label{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: iconOption.width+10
                        text: titel
                    }
                }
                Label{
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: value
                }
            }
            Item{
                id: editBox
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height-50
                visible: false
                ComboBox {
                    id: selectInput
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.width-60
                    height: 50
                    visible: if(optionType === "select"){true}else{false}
                    model: optionModel
                }
                TextField{
                    id: textInput
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.width-60
                    height: 50
                    visible: if(optionType === "string"){true}else{false}
                    placeholderText: stringPlaceholderText
                }
                SpinBox {
                    id: intInput
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.width-60
                    height: 50
                    value: value
                    from: 6
                    to: 99
                    visible: if(optionType === "int"){true}else{false}
                }
                Item {
                    id: colorInput
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.width-60
                    height: 50
                    visible: if(optionType === "color"){true}else{false}

                    ListView{
                        anchors.fill: parent
                        orientation: ListView.Horizontal
                        model: colorModel
                        delegate: ColorPicker_Delegate{}
                    }
                }
                MouseArea{
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height
                    height: parent.height
                    onClicked:  {
                        if(optionType === "string"){
                            value = textInput.text
                        }else if(optionType === "int"){
                            value = intInput.value
                        }else if(optionType === "select"){
                            value = selectInput.currentText
                        }
                        root.height = root.height-50
                        editBox.visible = false
                        isOpen = false
                        textInput.clear()
                    }

                    Image {
                        anchors.centerIn: parent
                        width: 25
                        height: 25
                        antialiasing: true
                        source: "qrc:/Assetes/Icons/delete_icon.png"
                    }
                }
            }
        }
    }
}
