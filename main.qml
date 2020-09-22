import QtQuick 2.15
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Truth and Dare"

    StackView{
        id: contentFrame
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("qrc:/Load_Page/Load_Page.qml")
    }
    Component.onCompleted: {
        contentFrame.replace("qrc:/Open_Page/Open_Page.qml")
    }
}
