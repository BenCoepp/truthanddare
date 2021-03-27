import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"
ListView{
    id: yourTruthAndDare_Page
    anchors.bottom: parent.bottom
    width: parent.width
    height: parent.height-50
    visible: false
    property date today: new Date()
    model: ListModel{
        id: yourTaDModel
    }
    delegate: Item {
        width: parent.width
        height: 50

        Label{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: truthAndDareText
        }
        Label{
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            text: truthAndDareDate
        }
    }
    footerPositioning: ListView.OverlayFooter
    footer: Item {
        width: parent.width
        height: 50

        ListView_Control_Button{
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            button1Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
            button2Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
            button3Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
            onButton1Clicked: {
                yourTaDModel.append({"truthAndDareText":"This is your T&D", "truthAndDareDate":today.toLocaleDateString()})
            }
        }
    }
}
