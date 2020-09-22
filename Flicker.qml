import QtQuick 2.9
import QtQuick.Controls 2.5

Item {
    width: parent.width
    height: parent.height

    Rectangle{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.width-100
        color: "blue"
    }

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
                name: "Bill Smith"
                number: "555 3264"
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
                Column {
                    Text { text: '<b>Name:</b> ' + name }
                    Text { text: '<b>Number:</b> ' + number }
                }
            }
        }
    }
}
