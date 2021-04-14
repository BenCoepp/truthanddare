import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"

Rectangle {
    color: "#282442"

    QRCode {
            anchors.top : parent.top
            anchors.topMargin : 30
            anchors.horizontalCenter : parent.horizontalCenter
            width : 320
            height : 320
            value : inputField.text
            level : "H"
        }
        TextInput {
            id : inputField
            anchors.bottom : parent.bottom
            anchors.bottomMargin : 30
            anchors.horizontalCenter : parent.horizontalCenter
            text : "https://www.youtube.com/watch?v=7B2PIVSWtJA"
        }
}
