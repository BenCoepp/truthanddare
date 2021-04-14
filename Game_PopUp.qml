import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: popupRoot
    anchors.centerIn: parent
    width: parent.width-20
    height: parent.height-100
    modal: true
    focus: true
    closePolicy: Popup.NoAutoClose

    property var tad_titel: "Titel1"
    property var tad_desc: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."
    property var tad_tagModel: ListModel{
        ListElement{
            titel: "Tag 1"
            icon: "qrc:/Assetes/Icons/plus_icon.png"
        }
        ListElement{
            titel: "Tag 1"
            icon: "qrc:/Assetes/Icons/plus_icon.png"
        }
        ListElement{
            titel: "Tag 1"
            icon: "qrc:/Assetes/Icons/plus_icon.png"
        }
    }

    onClosed: {
        //reset all of the elements in the game page
        resetAll()
    }

    Label{
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.bold: false
        font.pointSize: 10
        text: currentPlayer
    }
    Label{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 50
        text: tad_titel
        font.bold: true
        font.pointSize: 25
    }
    Label{
        anchors.centerIn: parent
        width: parent.width-20
        height: parent.width
        font.bold: false
        font.pointSize: 20
        text: tad_desc
        wrapMode: Text.WrapAnywhere
    }
    Item {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 80
        width: parent.width-20
        height: 50

        GridView{
            anchors.top: parent.top
            width: parent.width
            height: 50
            interactive: false
            model: tad_tagModel
            delegate: Item {
                width: tagDesc.width+25
                height: 25
                Image {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: icon
                    antialiasing: true
                    width: 20
                    height: 20
                }
                Label{
                    id: tagDesc
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    text: titel
                }
            }
        }

        ProgressBar{
            width: parent.width
            height: 5
            value: 0.5
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Item {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width-20
        height: 70

        Button{
            width: parent.width/2-10
            height: 45
            text: "Cancel"
            onClicked: {
                // give player minus points
                popupRoot.close()
            }
        }
        Button{
            anchors.right: parent.right
            width: parent.width/2-10
            height: 45
            text: "Accept"
            onClicked: {
                // give player plus points
                popupRoot.close()
            }
        }
    }
}
