import QtQuick 2.15
import QtQuick.Controls 2.15
import Firebase 1.0
Popup {
    id: popup
    anchors.centerIn: parent
    width: parent.width-20
    height: parent.width-20
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background: Rectangle{
        anchors.fill: parent
        color: "#1f344b"
    }

    NavBar_Custom{
        id: navBar
        navText: ""
        onBackButtonClicked: {
            contentFrame.replace("qrc:/Game/Open_Page.qml")
        }
    }
    SwipeView{
        id: login_swipeView
        currentIndex: 1
        Item{
            TextField{
                id: signUserIn_emailInput
                anchors.top: parent.top
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width-20
                placeholderText: qsTr("Email")
            }
            TextField{
                id: signUserIn_passwordInput
                anchors.top: parent.top
                anchors.topMargin: 110
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width-20
                placeholderText: qsTr("Password")
            }
            Button{
                anchors.bottom: parent.bottom
                width: parent.width
                height: 50
                onClicked: {
                    firebase.setAPIKey("AIzaSyB1s5mVGCw7sLcv3TkkzHJP20viEL390FY")
                    firebase.signUserIn(signUserIn_emailInput.text, signUserIn_passwordInput.text)
                }
            }
        }
        Item{
            MouseArea{
                anchors.top: parent.top
                width: parent.width
                height: parent.height/2
                onClicked: {
                    navBar.navText = "LogIn"
                    login_swipeView.setCurrentIndex(2)
                }
                Label{
                    anchors.centerIn: parent
                    text: "LogIn"
                }
            }
            MouseArea{
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height/2
                onClicked: {
                    navBar.navText = "SignUp"
                    login_swipeView.setCurrentIndex(0)
                }
                Label{
                    anchors.centerIn: parent
                    text: "SignUp"
                }
            }
        }
        Item{
            TextField{
                id: signUserUp_emailInput
                anchors.top: parent.top
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width-20
                placeholderText: qsTr("Email")
            }
            TextField{
                id: signUserUp_passwordInput
                anchors.top: parent.top
                anchors.topMargin: 110
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width-20
                placeholderText: qsTr("Password")
            }
            Button{
                anchors.bottom: parent.bottom
                width: parent.width
                height: 50
                onClicked: {
                    firebase.setAPIKey("AIzaSyB1s5mVGCw7sLcv3TkkzHJP20viEL390FY")
                    firebase.signUserUp(signUserUp_emailInput.text, signUserUp_passwordInput.text)
                }
            }
        }
    }
}
