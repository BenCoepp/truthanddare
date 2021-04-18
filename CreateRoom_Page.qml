import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"
Rectangle {
    color: "#282442"
    NavBar_Custom{
        id: navbar
        navText: "Join or Create Room"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Room_Page/RoomMAIN_Page.qml")
        }
    }
    SwipeView{
        id: createRoom_SwipeView
        anchors.fill: parent

        Item{
            QRCode {
                id: qrCode
                anchors.top : parent.top
                anchors.topMargin : 50
                anchors.horizontalCenter : parent.horizontalCenter
                width : parent.width-27
                height : parent.width-27
                value : "https://www.youtube.com/watch?v=7B2PIVSWtJA"
                level : "H"
            }
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: qrCode.height+100
                text: qrCode.value
                color: "white"
            }
            MouseArea{
                id: continueButton1
                anchors.bottom: parent.bottom
                width: parent.width
                height: 50
                enabled: false
                onClicked: {
                    createRoom_SwipeView.setCurrentIndex(1)
                }
                Rectangle{
                    id: continueButton1BG
                    anchors.fill: parent
                    color: "#1f344b"
                }
                Image {
                    anchors.centerIn: parent
                    width: parent.height-20
                    height: width
                    rotation: -90
                    antialiasing: true
                    source: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                }
            }
        }
        Item{

        }
    }
}
