import QtQuick 2.15
import QtQuick.Controls 2.12

Popup {
    id: newGamePopUp
    width: parent.width
    height: parent.height
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape

    SwipeView{
        id: newGameSwipeView
        anchors.fill: parent

        Rectangle{
            width: parent.width
            height: parent.height

            ListView{
                id: playerListView
                anchors.bottom: parent.bottom
                width: parent.width
                height: 360
                footer: Item {
                    width: parent.width
                    height: 50

                    RoundButton{
                        anchors.right: parent.right
                        anchors.rightMargin: 50
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
        Rectangle{
            width: parent.width
            height: parent.height

            ListView{

            }
        }
    }
}
