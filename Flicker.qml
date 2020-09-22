import QtQuick 2.9
import QtQuick.Controls 2.5

Item {
    width: parent.width
    height: parent.height
    property var bgColor: ""


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
                color: bgColor

            }
        }
    }
    Rectangle{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.width-100
        color: bgColor
    }
}
