import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.LocalStorage 2.12
import "qrc:/Database/LocalStorage_Settings.js" as LocalStorage_Settings
import JSON_HANDLER 1.0
import Firebase 1.0
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
    JSON_HANDLER{
        id: jsonHandler
    }
    Firebase{
        id: firebase
    }

    Component.onCompleted: {
        jsonHandler.writeJson("tad_data", firebase.get(".json"))
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
