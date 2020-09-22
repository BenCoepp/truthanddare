import QtQuick 2.9
import QtQuick.Controls 2.5
import "qrc:/Components"

Item {
    width: parent.width
    height: parent.height

    Rectangle{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.width-100
        color: "blue"
    }

    Item {
        width: parent.width
        height: parent.height

        ListView {
            anchors.fill: parent
            header: Item {
                width: parent.width
                height: parent.width
                 Label{anchors.centerIn: parent; text: "IMG"}
            }
            headerPositioning: ListView.OverlayHeader
            model: ListModel {
                ListElement {
                    titel: "My Titel"
                    number: ""
                }
            }
            delegate: Item {
                width: parent.width; height: 1000
                Rectangle{
                    width: parent.width
                    height: 1000
                    radius: 20
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -20
                    color: "blue"

                    Button_Custom{
                        id: button
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 100
                        bgColor: "blue"
                    }
                }
            }
        }
    }
}
