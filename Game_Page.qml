import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"
Rectangle {
    color: "#282442"
    width: 360
    height: 640

    property var selectedType: ""
    property var currentPlayer: "Player 1"

    Canvas{
        anchors.fill:parent
        onPaint:{
            var context = getContext("2d");
            // the triangle
            context.beginPath()
            context.moveTo(0, 0)
            context.lineTo(parent.width, 0)
            context.lineTo(0, parent.height)
            context.closePath()
            // the fill color
            context.fillStyle = "red";
            context.fill();
        }
    }
    Rectangle{
        id: rCrec
        anchors.right: parent.right
        width: 0
        height: parent.height
        color: "orange"

        PropertyAnimation {
            id: anRcrec
            target: rCrec
            property: "width"
            from: 0
            to: parent.width
            duration: 250
        }
    }
    Canvas{
        anchors.fill:parent
        onPaint:{
            var context = getContext("2d");
            // the triangle
            context.beginPath()
            context.moveTo(parent.width, 0)
            context.lineTo(0, parent.height)
            context.lineTo(parent.width, parent.height)
            context.closePath()
            // the fill color
            context.fillStyle = "orange";
            context.fill();
        }
    }

    Rectangle{
        id: lCrec
        anchors.left: parent.left
        width: 0
        height: parent.height
        color: "red"
        PropertyAnimation {
            id: anLcrec
            target: lCrec
            property: "width"
            from: 0
            to: parent.width
            duration: 250
        }
    }
    Label{
        id: dareTitelLabel
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Dares"
        font.bold: true
        font.pointSize: 50
    }
    Label{
        id: truthTitelLabel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Truth"
        font.bold: true
        font.pointSize: 50
    }
    Label{
        id: swipeLabel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        text: "<-- Swipe -->"
        font.bold: true
        font.pointSize: 12
        visible: false
    }

    MouseArea {
        anchors.fill: parent
        property variant previousPosition: 0
        property variant direction: 0

        onPressed: {
            previousPosition = mouseX;
            direction = 0;
            console.debug("onPressed mouseX:" + mouseX);
        }

        onPositionChanged: {
            if(previousPosition > mouseX){
                direction = 1;
            }
            else if(previousPosition < mouseX){
                direction = -1;
            }
            else{
                direction = 0;
            }
            previousPosition = mouseX;
        }

        onReleased: {
            if(direction > 0){
                console.debug("swipe to right"); // Truth
                selectedType = "truth"
                anRcrec.start()
                dareTitelLabel.visible = false
                swipeLabel.visible = false
                navbar.visible = false
                swipeLabelTimer.stop()
                game_popup.open()
            }
            else if(direction < 0){
                console.debug("swipe to left"); // Dare
                selectedType = "dare"
                anLcrec.start()
                truthTitelLabel.visible = false
                swipeLabel.visible = false
                navbar.visible = false
                swipeLabelTimer.stop()
                game_popup.open()
            }
            else{
                console.debug("swipe no detected");
            }
        }
    }

    NavBar_Custom{
        id: navbar
        //navText: currentPlayer + " your Turn"
        navText: "your Tunr"
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
    Timer{
        id: swipeLabelTimer
        interval: 5000
        onTriggered: {
            swipeLabel.visible = true
        }
    }

    Game_PopUp{
        id: game_popup
    }

    // T|D :: M|F :: Age :: Mode :: [Options-Preferences] :: Points ::

    Component.onCompleted: {
        //alle daten aus der tabelle raus
        //random neuer spieler
        //tad_auswahl(player, T|D)
        startAnimation()
    }

    function startAnimation(){
        swipeLabelTimer.start() //Start Timer for swipeLabel popup
    }
    function resetAll(){
        swipeLabel.visible = false
        rCrec.width = 0
        lCrec.width = 0
        dareTitelLabel.visible = true
        truthTitelLabel.visible = true
        navbar.visible = true
        selectedType = ""
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
