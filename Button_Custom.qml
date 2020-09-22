import QtQuick 2.9
import QtQuick.Controls 2.5


Button {
    width: parent.width
    height: 60

    property var bgColor: ""

    background: Rectangle{
        anchors.fill: parent
        color: bgColor
    }

    Rectangle{
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        width: parent.height
        height: parent.height
        color: "red"

        Image {
            anchors.fill: parent
            antialiasing: true
            source: "file"
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/
