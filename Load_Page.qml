import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    color: "#2C3E50"

    BusyIndicator{
        anchors.centerIn: parent
    }

    Label{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        text: "Ben Coepp"
        color: "white"
        font.bold: true
        font.pointSize: 20
    }
}
