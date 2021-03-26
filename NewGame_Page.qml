import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    SwipeView{
        id: newGameSwipeView
        anchors.fill: parent

        Rectangle{
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 50
                text: "new player"
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(1)
                }
            }
        }
        Rectangle{
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 50
                text: "game mode"
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.left: parent.left
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(0)
                }
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.right: parent.right
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(2)
                }
            }
        }
        Rectangle{
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 50
                text: "things you have"
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.left: parent.left
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(1)
                }
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.right: parent.right
                height: 50
                onClicked: {
                    contentFrame.replace("qrc:/Game/Game_Page.qml")
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5;height:720;width:360}
}
##^##*/
