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

    // 左侧菜单
    Rectangle {
        id: leftMenu
        width: 0.1 * window.width
        height: window.height
        visible: true
        color: "#f5f5f5"
        border.color: "#ddd"
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 20

            Label {
                id: pay
                text: "礼佛"
                font.bold: true
                font.pixelSize: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                
                background: Rectangle {
                    id: payBackground
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    radius: 8

                    property bool mouseHover: false
                    color: mouseHover ? "#e0e0e0" : "transparent"
                }
                
                MouseArea {
                    id: payMouseArea
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // 开启悬停监听
                    hoverEnabled: true
                    onEntered: payBackground.mouseHover = true
                    onExited: payBackground.mouseHover = false

                    onClicked: {
                        console.log("click pay")
                    }
                }
            }

            Label {
                id: pray
                text: "祈福"
                font.bold: true
                font.pixelSize: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                
                background: Rectangle {
                    id: prayBackground
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    radius: 8

                    property bool mouseHover: false
                    color: mouseHover ? "#e0e0e0" : "transparent"
                }
                
                MouseArea {
                    id: prayMouseArea
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // 开启悬停监听
                    hoverEnabled: true
                    onEntered: prayBackground.mouseHover = true
                    onExited: prayBackground.mouseHover = false

                    onClicked: {
                        console.log("click pray")
                    }
                }
            }

            Label {
                id: light
                text: "点灯"
                font.bold: true
                font.pixelSize: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                
                background: Rectangle {
                    id: lightBackground
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    radius: 8

                    property bool mouseHover: false
                    color: mouseHover ? "#e0e0e0" : "transparent"
                }

                MouseArea {
                    id: lightMouseArea
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // 开启悬停监听
                    hoverEnabled: true
                    onEntered: lightBackground.mouseHover = true
                    onExited: lightBackground.mouseHover = false

                    onClicked: {
                        console.log("click light")
                    }
                }
            }

            Label {
                id: donate
                text: "捐赠"
                font.bold: true
                font.pixelSize: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                
                background: Rectangle {
                    id: donateBackground
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    radius: 8

                    property bool mouseHover: false
                    color: mouseHover ? "#e0e0e0" : "transparent"
                }

                MouseArea {
                    id: donateMouseArea
                    width: parent.width
                    height: 0.3 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // 开启悬停监听
                    hoverEnabled: true
                    onEntered: donateBackground.mouseHover = true
                    onExited: donateBackground.mouseHover = false

                    onClicked: {
                        console.log("click donate")
                    }
                }
            }
        }
    }

    Button {
        text: "上传文件"
        anchors.centerIn: parent
        onClicked: {
            fileDialog.open()
        }
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    FileDialog {
        id: fileDialog
        title: "选择文件"
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: {
            image.source = selectedFile
            pay.saveImagePath(selectedFile)
        }
        nameFilters: ["所有文件 (*.*)", "图像文件 (*.png *.jpg *.bmp)"]
    }

    // component Tomato: Label {
    //     id: tomato
    //     objectName: text
    //     horizontalAlignment: Label.AlignHCenter
    //     verticalAlignment: Label.AlignVCenter
    //     width: Math.max(200, contentWidth * 1.5, contentWidth * 1.5)
    //     height: width
    //     color: skinColor

    //     function eat() { print("Ate " + text) }
    //     function ditch() { print("Threw " + text) }
    //     function squash() { print("Squashed " + text) }

    //     property color skinColor: "tomato"

    //     background: Rectangle {
    //         color: tomato.skinColor
    //         radius: width / 2
    //     }

    //     ContextMenu.menu: contextMenu
    // }

    // Menu {
    //     id: contextMenu

    //     readonly property Tomato triggerItem: parent as Tomato
    //     readonly property string triggerItemText: triggerItem?.text ?? ""

    //     MenuItem {
    //         text: qsTr("Eat %1").arg(contextMenu.triggerItemText)
    //         onTriggered: contextMenu.triggerItem.eat()
    //     }
    //     MenuItem {
    //         text: qsTr("Throw %1").arg(contextMenu.triggerItemText)
    //         onTriggered: contextMenu.triggerItem.ditch()
    //     }
    //     MenuItem {
    //         text: qsTr("Squash %1").arg(contextMenu.triggerItemText)
    //         onTriggered: contextMenu.triggerItem.squash()
    //     }
    // }

    // Row {
    //     anchors.centerIn: parent

    //     Tomato {
    //         text: qsTr("tomato")
    //     }

    //     Tomato {
    //         text: qsTr("really ripe tomato")
    //         skinColor: "maroon"
    //     }
    // }
}
