import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.LocalStorage 2.12
import "qrc:/Database/LocalStorage_Settings.js" as LocalStorage_Settings

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Truth and Dare"

    property var firstOpen: LocalStorage_Settings.dbGet("firstOpen") || "false"


    StackView{
        id: contentFrame
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("qrc:/main/Load_Page.qml")
    }
    Component.onCompleted: {
        LocalStorage_Settings.dbInit()
        //console.log(LocalStorage_Settings.dbGet("firstOpen"))
        if(firstOpen !== "true"){
            contentFrame.replace("qrc:/main/FirstOpen_Page.qml")
            LocalStorage_Settings.dbSet("firstOpen", "true")
        }else{
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
}
