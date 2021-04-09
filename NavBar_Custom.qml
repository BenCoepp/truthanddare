import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    height: 50
    width: parent.width

    property var navText: ""
    property var titelColor: "white"
    property var icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"

    signal backButtonClicked()

    MouseArea{
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: 50
        height: 50
        onClicked: backButtonClicked()
        Image {
            anchors.centerIn: parent
            width: 30
            height: 30
            antialiasing: true
            source: icon
        }
    }

    Label{
        anchors.centerIn: parent
        text: navText
        font.bold: true
        font.pointSize: 10
        color: titelColor
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9;width:360}
}
##^##*/
