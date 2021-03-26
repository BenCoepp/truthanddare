import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Truth and Dare"

    property var firstOpen: false

    StackView{
        id: contentFrame
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("qrc:/main/Load_Page.qml")
    }
    Component.onCompleted: {
        if(firstOpen !== true){
            contentFrame.replace("qrc:/main/FirstOpen_Page.qml")
        }else{
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
}
