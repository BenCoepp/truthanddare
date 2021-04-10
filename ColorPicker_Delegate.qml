import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.12

MouseArea {
    height: parent.height
    width: height
    onClicked: {
        popup.open()
    }

    Rectangle{
        anchors.centerIn: parent
        width: parent.width-10
        height: parent.height-10
        radius: 5
        color: colorValue
    }

    Popup {
        id: popup
        anchors.centerIn: Overlay.overlay
        width: 360
        height: 360
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }
}
