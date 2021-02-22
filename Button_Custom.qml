import QtQuick 2.15
import QtQuick.Controls 2.12


Button {
    width: parent.width
    height: 60

    property var bgColor: ""
    property var btColor: ""
    property var btText: ""
    property var btIcon: ""

    background: Rectangle{
        anchors.fill: parent
        color: bgColor

        Label{
            anchors.centerIn: parent
            text: btText
        }
    }
    onClicked: {
        this.height = parent.height
        this.width = parent.width
    }

    Behavior on width {PropertyAnimation { properties: "width"; easing.type: Easing.InOutQuad }}
    Behavior on height {PropertyAnimation { properties: "height"; easing.type: Easing.InOutQuad }}

    Rectangle{
        id: rec
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        width: parent.height
        height: parent.height
        color: btColor

        Image {
            anchors.fill: parent
            antialiasing: true
            source: btIcon
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/
