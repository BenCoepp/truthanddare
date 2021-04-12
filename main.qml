import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.LocalStorage 2.12
import "qrc:/Database/LocalStorage_Settings.js" as LocalStorage_Settings
import JSON_HANDLER 1.0
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

    Component.onCompleted: {
        getData()
        LocalStorage_Settings.dbInit()
        //console.log(LocalStorage_Settings.dbGet("firstOpen"))
        if(firstOpen !== "true"){
            contentFrame.replace("qrc:/main/FirstOpen_Page.qml")
            LocalStorage_Settings.dbSet("firstOpen", "true")
        }else{
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
    function getData(){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if(xhr.readyState === XMLHttpRequest.DONE) {
                jsonHandler.writeJson("data",xhr.responseText)
                return xhr.responseText;
            }
        }
        xhr.open("Get", "https://truthanddare-bencoepp-default-rtdb.europe-west1.firebasedatabase.app/.json");
        xhr.send();
    }
}
