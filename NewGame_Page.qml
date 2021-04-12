import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.12
import "qrc:/Components"
import JSON_HANDLER 1.0

Item {
    property var currentMode: 0
    SwipeView{
        id: newGameSwipeView
        anchors.fill: parent
        interactive: false
        currentIndex: 0
        Rectangle{
            color: "#282442"
            NavBar_Custom{
                navText: "Add Players"
                onBackButtonClicked: {
                    contentFrame.replace("qrc:/Game/Open_Page.qml")
                }
            }
            Label{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                text: newPlayerListModel.count
                font.bold: true
                font.pointSize: 522
                antialiasing: true
                color: "#1f344b"
            }
            ListView{
                width: parent.width
                height: parent.height-50
                anchors.bottom: parent.bottom
                model: ListModel{
                    id: newPlayerListModel
                    onCountChanged: {
                        if(this.count >= 2){
                            continueButton1.enabled = true
                            continueButton1BG.color = "#fc5b19"
                        }else{
                            continueButton1.enabled = false
                            continueButton1BG.color = "#1f344b"
                        }
                    }
                }
                footerPositioning: ListView.OverlayFooter
                footer: Item {
                    width: parent.width
                    height: 100

                    ListView_Control_Button{
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        button1Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                        button2Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                        button3Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                        onButton1Clicked: {
                            newPlayer_drawer.open()
                        }
                    }
                }
                delegate: MouseArea {
                    width: parent.width
                    height: 70

                    property var isOpen: false

                    onClicked: {
                        if(isOpen === false){
                            this.height = this.height*3
                            tagGridView.visible = true
                            isOpen = true
                        }else{
                            this.height = this.height/3
                            tagGridView.visible = false
                            isOpen = false
                        }
                    }

                    Rectangle{
                        anchors.centerIn: parent
                        width: parent.width-20
                        height: parent.height-20
                        radius: 5
                        Item {
                            anchors.top: parent.top
                            width: parent.width
                            height: 50

                            Image {
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                width: 30
                                height: 30
                                source: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                            }
                            Item {
                                anchors.centerIn: parent
                                width: parent.width/2
                                height: 50
                                Label{
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: playerName
                                }
                                Label{
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: playerAge
                                }
                            }
                            Image {
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                width: 30
                                height: 30
                                source: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                            }
                        }
                        Item {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: parent.height-50

                            GridView{
                                id: tagGridView
                                visible: false
                                anchors.fill: parent
                                cellHeight: 35
                                cellWidth: 80
                                model: playerTagData
                                delegate: Item {
                                    width: 80
                                    height: 25
                                    Image {
                                        anchors.left: parent.left
                                        anchors.verticalCenter: parent.verticalCenter
                                        source: icon
                                        antialiasing: true
                                        width: 20
                                        height: 20
                                    }
                                    Label{
                                        anchors.right: parent.right
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: titel
                                    }
                                }
                            }
                        }
                    }
                }
            }
            MouseArea{
                id: continueButton1
                anchors.bottom: parent.bottom
                width: parent.width
                height: 50
                enabled: false
                onClicked: {
                    newGameSwipeView.setCurrentIndex(1)
                }
                Rectangle{
                    id: continueButton1BG
                    anchors.fill: parent
                    color: "#1f344b"
                }
                Image {
                    anchors.centerIn: parent
                    width: parent.height-20
                    height: width
                    rotation: -90
                    antialiasing: true
                    source: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                }
            }
        }
        Rectangle{
            color: "#282442"
            NavBar_Custom{
                navText: "Choose Mode"
                onBackButtonClicked: {
                    contentFrame.replace("qrc:/Game/Open_Page.qml")
                }
            }
            ListView{
                id: modeListView
                anchors.centerIn: parent
                width: parent.width
                height: parent.width
                orientation: ListView.Horizontal
                snapMode: ListView.SnapToItem
                highlight: Rectangle {color: 'grey'}
                focus: true
                model: ListModel{
                    id: modeListModel
                    ListElement{
                        value: "1"
                        titel: "Easy"
                        count: 520
                        like: 899
                        desc: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."
                    }
                    ListElement{
                        value: "2"
                        titel: "Normal"
                        count: 520
                        like: 899
                        desc: ""
                    }
                    ListElement{
                        value: "3"
                        titel: "Couple"
                        count: 520
                        like: 899
                        desc: ""
                    }
                    ListElement{
                        value: "4"
                        titel: "Hardcore"
                        count: 520
                        like: 899
                        desc: ""
                    }
                    ListElement{
                        value: "5"
                        count: 520
                        like: 899
                        titel: "Devil"
                        desc: ""
                    }
                }
                delegate: MouseArea{
                    width: 360
                    height: 360

                    Rectangle{
                        anchors.centerIn: parent
                        width: parent.width-20
                        height: parent.height-20
                        color: "lightblue"
                        radius: 5

                        Item {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset: -20
                            anchors.right: parent.right
                            anchors.rightMargin: 20

                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: countID.width+5
                                antialiasing: true
                                width: 15
                                height: 15
                                source: "qrc:/Assetes/Icons/plus_icon.png"
                            }
                            Label{
                                id: countID
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                text: count
                            }
                        }
                        Item {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset: -20
                            anchors.right: parent.right
                            anchors.rightMargin: countID.width+55

                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: likeID.width+5
                                antialiasing: true
                                width: 15
                                height: 15
                                source: "qrc:/Assetes/Icons/plus_icon.png"
                            }
                            Label{
                                id: likeID
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                text: like
                            }
                        }

                        Rectangle{
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: parent.height/2
                            radius: 5

                            Label{
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                text: titel
                                font.bold: true
                                font.pointSize: 25
                                color: "#fc5b19"
                            }
                            Label{
                                anchors.top: parent.top
                                anchors.topMargin: 50
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: desc
                                width: parent.width-20
                                height: parent.height-50
                                wrapMode: Text.WrapAnywhere
                            }
                        }
                    }
                    onClicked: {
                        modeListView.currentIndex = index
                        currentMode = modeListView.currentIndex
                    }
                }
            }

            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.left: parent.left
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(0)
                }
                Rectangle{
                    anchors.fill: parent
                    color: "green"
                }
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.right: parent.right
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(2)
                }
                Rectangle{
                    anchors.fill: parent
                    color: "red"
                }
            }
        }
        Rectangle{
            color: "#282442"
            NavBar_Custom{
                navText: "What do you want?"
                onBackButtonClicked: {
                    contentFrame.replace("qrc:/Game/Open_Page.qml")
                }
            }
            ObjectModel{
                id: chooseModel
                ComboBox {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width-20
                    height: 50
                    model: ["First", "Second", "Third"]
                }
                GridView{
                    width: newGameSwipeView.width
                    model: ListModel{
                        ListElement{titel: "Ice Cream"; value: "ice_cream"}
                        ListElement{titel: "Ice Cream"; value: "ice_cream"}
                        ListElement{titel: "Ice Cream"; value: "ice_cream"}
                        ListElement{titel: "Ice Cream"; value: "ice_cream"}
                        ListElement{titel: "Ice Cream"; value: "ice_cream"}
                        ListElement{titel: "Ice Cream"; value: "ice_cream"}
                    }
                    delegate: Item {
                        width: newGameSwipeView.width/2
                        height: 50
                        CheckBox{
                            anchors.centerIn: parent
                            text: titel
                        }
                    }
                }
            }

            ListView {
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height-50
                model: chooseModel
                spacing: 10
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.left: parent.left
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(1)
                }
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.right: parent.right
                height: 50
                onClicked: {
                    contentFrame.replace("qrc:/Game/Game_Page.qml")
                    //alle spiel daten in den local file
                    //currentMode:
                    //players:[]
                    //options:[]

                    //jsonHandler.writeListModel("testOutput", newPlayerListModel.get(1).playerName)
                }
            }
        }
    }
    NewPlayer_Drawer{
        id: newPlayer_drawer
    }
    JSON_HANDLER{
        id: jsonHandler
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5;height:720;width:360}
}
##^##*/
