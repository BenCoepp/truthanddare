import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Rectangle{
    anchors.fill: parent
    color: "#2C3E50"

    Label{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        text: "Settings"
        color: "white"
        font.bold: true
        font.pointSize: 20
    }

    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: 50
        Switch {
            text: qsTr("Light")
            checked: false
            onCheckedChanged: {
                if(this.checked === true){
                    this.text = "Dark"
                }else{
                    this.text = "Light"
                }
            }
        }
        Switch {
            text: qsTr("Bluetooth")
        }
    }

    MouseArea{
        anchors.bottom: parent.bottom
        width: parent.width
        height: 50
        onClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }

    }
}
