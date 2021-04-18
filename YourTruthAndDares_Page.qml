import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"
Rectangle{
    color: "#282442"

    property date today: new Date()

    NavBar_Custom{
        id: navbar
        navText: "Your Truth & Dares"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Add_TAD/AddTAD_Page.qml")
        }
    }
    ListView{
        id: yourTruthAndDare_Page
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height-50
        model: ListModel{
            id: yourTaDModel
        }
        delegate: Item {
            width: parent.width
            height: 70

            Rectangle{
                anchors.centerIn: parent
                width: parent.width-20
                height: parent.height-20
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
        }
        footerPositioning: ListView.OverlayFooter
        footer: Item {
            width: parent.width
            height: 50
            ListView_Control_Button{
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                button1Icon: "qrc:/Assetes/Icons/plus_icon.png"
                button2Icon: "qrc:/Assetes/Icons/plus_icon.png"
                button3Icon: "qrc:/Assetes/Icons/plus_icon.png"
                onButton1Clicked: {
                    yourTaDModel.append({"truthAndDareText":"This is your T&D", "truthAndDareDate":today.toLocaleDateString()})
                }
            }
        }
    }
}
