import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: parent.width
    height: 50

    property var pText: "Player Name..."

    TextField{
        anchors.centerIn: parent
        placeholderText: pText
    }
}
