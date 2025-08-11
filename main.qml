import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("功德箱")

    property int currentPage: 0

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: leftBox
            width: 0.1 * window.width
            height: window.height
            visible: true
            color: "#f5f5f5"
            border.color: "#ddd"
            border.width: 1

            Component {
                id: contactDelegate
                Item {
                    id: menuItem
                    required property string name
                    width: 180; height: 40
                    Column {
                        Text { text: menuItem.name }
                    }
                }
            }

            ListView {
                id: leftMenu
                anchors.fill: parent
                // Layout.preferredWidth: 0.1 * window.width
                // Layout.fillHeight: true
                model: ListModel {
                    ListElement {
                        name: "礼佛";
                        page: "qml/Pay.qml"
                    }
                    ListElement {
                        name: "Pray";
                        page: "qml/Pray.qml"
                    }
                    ListElement {
                        name: "Light";
                        page: "qml/Light.qml"
                    }
                    ListElement {
                        name: "Donate";
                        page: "qml/Donate.qml"
                    }
                }

                delegate: contactDelegate

                highlight: Rectangle {
                    color: "lightsteelblue"; radius: 5
                }

                focus: true
                // delegate: Text {
                //     required property string name
                //     // required property string page
                //     text: name
                // }


                // delegate: Rectangle {
                //     width: leftMenu.width
                //     height: 50
                //     color: ListView.isCurrentItem ? "#aaa" : "#ccc"

                //     Text {
                //         anchors.centerIn: parent
                //         text: name
                //     }

                //     MouseArea {
                //         anchors.fill: parent
                //         onClicked: {
                //             contentLoader.source = page
                //             menuList.currentIndex = index
                //         }
                //     }
                // }
            }
        }

        // 左侧菜单


        Loader {
            id: contentLoader
            Layout.fillWidth: true
            Layout.fillHeight: true
            source: "qml/Pay.qml"
        }
    }
}
            // width: 0.1 * window.width
            // height: window.height
            // visible: true
            // color: "#f5f5f5"
            // border.color: "#ddd"
            // border.width: 1

        //     ColumnLayout {
        //         anchors.fill: parent
        //         anchors.margins: 20
        //         spacing: 20

        //         Label {
        //             id: pay
        //             text: "礼佛"
        //             font.bold: true
        //             font.pixelSize: 20
        //             Layout.fillWidth: true
        //             Layout.fillHeight: true
        //             horizontalAlignment: Label.AlignHCenter
        //             verticalAlignment: Label.AlignVCenter

        //             background: Rectangle {
        //                 id: payBackground
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter
        //                 radius: 8

        //                 property bool mouseHover: false
        //                 property bool isActive: mainWindow.currentPage === 0
        //                 color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
        //             }

        //             MouseArea {
        //                 id: payMouseArea
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter

        //                 // 开启悬停监听
        //                 hoverEnabled: true
        //                 onEntered: payBackground.mouseHover = true
        //                 onExited: payBackground.mouseHover = false

        //                 onClicked: {
        //                     console.log("click pay")
        //                     mainWindow.currentPage = 0
        //                     mainStackView.replace(payPage)
        //                 }
        //             }
        //         }

        //         Label {
        //             id: pray
        //             text: "祈福"
        //             font.bold: true
        //             font.pixelSize: 20
        //             Layout.fillWidth: true
        //             Layout.fillHeight: true
        //             horizontalAlignment: Label.AlignHCenter
        //             verticalAlignment: Label.AlignVCenter

        //             background: Rectangle {
        //                 id: prayBackground
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter
        //                 radius: 8

        //                 property bool mouseHover: false
        //                 property bool isActive: mainWindow.currentPage === 1
        //                 color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
        //             }

        //             MouseArea {
        //                 id: prayMouseArea
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter

        //                 // 开启悬停监听
        //                 hoverEnabled: true
        //                 onEntered: prayBackground.mouseHover = true
        //                 onExited: prayBackground.mouseHover = false

        //                 onClicked: {
        //                     console.log("click pray")
        //                     mainWindow.currentPage = 1
        //                     mainStackView.replace(prayPage)
        //                 }
        //             }
        //         }

        //         Label {
        //             id: light
        //             text: "点灯"
        //             font.bold: true
        //             font.pixelSize: 20
        //             Layout.fillWidth: true
        //             Layout.fillHeight: true
        //             horizontalAlignment: Label.AlignHCenter
        //             verticalAlignment: Label.AlignVCenter

        //             background: Rectangle {
        //                 id: lightBackground
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter
        //                 radius: 8

        //                 property bool mouseHover: false
        //                 property bool isActive: currentPage === 2
        //                 color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
        //             }

        //             MouseArea {
        //                 id: lightMouseArea
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter

        //                 // 开启悬停监听
        //                 hoverEnabled: true
        //                 onEntered: lightBackground.mouseHover = true
        //                 onExited: lightBackground.mouseHover = false

        //                 onClicked: {
        //                     console.log("click light")
        //                     currentPage = 2
        //                     mainStackView.replace(lightPage)
        //                 }
        //             }
        //         }

        //         Label {
        //             id: donate
        //             text: "捐赠"
        //             font.bold: true
        //             font.pixelSize: 20
        //             Layout.fillWidth: true
        //             Layout.fillHeight: true
        //             horizontalAlignment: Label.AlignHCenter
        //             verticalAlignment: Label.AlignVCenter

        //             background: Rectangle {
        //                 id: donateBackground
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter
        //                 radius: 8

        //                 property bool mouseHover: false
        //                 property bool isActive: currentPage === 3
        //                 color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
        //             }

        //             MouseArea {
        //                 id: donateMouseArea
        //                 width: parent.width
        //                 height: 0.3 * parent.height
        //                 anchors.horizontalCenter: parent.horizontalCenter
        //                 anchors.verticalCenter: parent.verticalCenter

        //                 // 开启悬停监听
        //                 hoverEnabled: true
        //                 onEntered: donateBackground.mouseHover = true
        //                 onExited: donateBackground.mouseHover = false

        //                 onClicked: {
        //                     console.log("click donate")
        //                     currentPage = 3
        //                     mainStackView.replace(donatePage)
        //                 }
        //             }
        //         }
        //     }
        // }

    // Button {
    //     text: "上传文件"
    //     anchors.bottom: parent.bottom
    //     anchors.right: parent.right
    //     anchors.margins: 20
    //     onClicked: {
    //         fileDialog.open()
    //     }
    // }

    // Image {
    //     id: image
    //     anchors.fill: parent
    //     fillMode: Image.PreserveAspectFit
    //     visible: false // 默认隐藏，只在需要时显示
    // }

    // FileDialog {
    //     id: fileDialog
    //     title: "选择文件"
    //     currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
    //     onAccepted: {
    //         image.source = selectedFile
    //         // pay.saveImagePath(selectedFile)
    //     }
    //     nameFilters: ["所有文件 (*.*)", "图像文件 (*.png *.jpg *.bmp)"]
    // }
