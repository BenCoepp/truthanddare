import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: popupRoot
    anchors.centerIn: parent
    width: parent.width-20
    height: parent.height-100
    modal: true
    focus: true


    Label{
        anchors.fill: parent
        text: selectedType
    }
}
