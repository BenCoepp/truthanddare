import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/Components"

Item {
    property var currentMode: 0
    SwipeView{
        id: newGameSwipeView
        anchors.fill: parent
        interactive: false
        Rectangle{
            NavBar_Custom{
                navText: "Add Players"
                onBackButtonClicked: {
                    contentFrame.replace("qrc:/Game/Open_Page.qml")
                }
            }
            Label{
                anchors.centerIn: parent
                text: newPlayerListModel.count
                font.bold: true
                font.pointSize: 522
                color: "lightblue"
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
                        }else{
                            continueButton1.enabled = false
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
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        button1Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                        button2Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                        button3Icon: "qrc:/Assetes/Icons/Expand Arrow icon.png"
                        onButton1Clicked: {
                            newPlayer_drawer.open()
                        }
                    }
                }
                delegate: Item {
                    width: parent.width
                    height: 70

                    Rectangle{
                        anchors.centerIn: parent
                        width: parent.width-20
                        height: 50
                        radius: 5

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
            }
        }
        Rectangle{
            NavBar_Custom{
                navText: "Choose Mode"
                onBackButtonClicked: {
                    contentFrame.replace("qrc:/Game/Open_Page.qml")
                }
            }
            ListView{
                anchors.centerIn: parent
                width: parent.width
                height: parent.width
                model: ListModel{
                    id: modeListModel
                    ListElement{
                        value: "1"
                        titel: "Easy"
                    }
                    ListElement{
                        value: "2"
                        titel: "Normal"
                    }
                    ListElement{
                        value: "3"
                        titel: "Couple"
                    }
                    ListElement{
                        value: "4"
                        titel: "Hardcore"
                    }
                    ListElement{
                        value: "5"
                        titel: "Devil"
                    }
                }
                delegate: MouseArea{
                    width: parent.width
                    height: 50

                    Label{
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        text: titel
                    }
                    onClicked: {
                        console.log(value)
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
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width/2
                anchors.right: parent.right
                height: 50
                onClicked: {
                    newGameSwipeView.setCurrentIndex(2)
                }
            }
        }
        Rectangle{
            NavBar_Custom{
                navText: "What do you want?"
                onBackButtonClicked: {
                    contentFrame.replace("qrc:/Game/Open_Page.qml")
                }
            }
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 50
                text: "things you have"
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
                }
            }
        }
    }
    NewPlayer_Drawer{
        id: newPlayer_drawer
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5;height:720;width:360}
}
##^##*/
