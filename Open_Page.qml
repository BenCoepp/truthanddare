import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    anchors.fill: parent
    color: "#2C3E50"

    MouseArea{
        width: parent.width
        height: 50
        onClicked: {
            contentFrame.replace("qrc:/Game/NewGame_Page.qml")
        }
    }
}
