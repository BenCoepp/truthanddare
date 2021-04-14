import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"

Rectangle {
    color: "#282442"

    QRCode {
        id: qrCode
        anchors.top : parent.top
        anchors.topMargin : 50
        anchors.horizontalCenter : parent.horizontalCenter
        width : parent.width-27
        height : parent.width-27
        value : "https://www.youtube.com/watch?v=7B2PIVSWtJA"
        level : "H"
    }
    Label{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: qrCode.height+100
        text: qrCode.value
        color: "white"
    }
}
