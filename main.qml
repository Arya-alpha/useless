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

    // 主界面切换系统
    property int currentPage: 0 // 0: 礼佛, 1: 祈福, 2: 点灯, 3: 捐赠

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
                    property bool isActive: currentPage === 0
                    color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
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
                        currentPage = 0
                        mainStackView.replace(payPage)
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
                    property bool isActive: currentPage === 1
                    color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
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
                        currentPage = 1
                        mainStackView.replace(prayPage)
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
                    property bool isActive: currentPage === 2
                    color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
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
                        currentPage = 2
                        mainStackView.replace(lightPage)
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
                    property bool isActive: currentPage === 3
                    color: isActive ? "#4CAF50" : (mouseHover ? "#e0e0e0" : "transparent")
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
                        currentPage = 3
                        mainStackView.replace(donatePage)
                    }
                }
            }
        }
    }

    // 主内容区域
    Rectangle {
        id: mainContent
        anchors.left: leftMenu.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: "#ffffff"

        StackView {
            id: mainStackView
            anchors.fill: parent
            initialItem: payPage
        }
    }

    // 礼佛页面
    Component {
        id: payPage
        Rectangle {
            color: "#fafafa"
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20
                
                Image {
                    source: "qrc:/images/buddha.png" // 如果有图片资源的话
                    width: 200
                    height: 200
                    fillMode: Image.PreserveAspectFit
                }
                
                Label {
                    text: "礼佛"
                    font.pixelSize: 32
                    font.bold: true
                    color: "#333"
                }
                
                Label {
                    text: "虔诚礼佛，功德无量"
                    font.pixelSize: 18
                    color: "#666"
                }
                
                Button {
                    text: "开始礼佛"
                    font.pixelSize: 16
                    onClicked: {
                        console.log("开始礼佛仪式")
                    }
                }
            }
        }
    }

    // 祈福页面
    Component {
        id: prayPage
        Rectangle {
            color: "#fafafa"
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20
                
                Image {
                    source: "qrc:/images/pray.png" // 如果有图片资源的话
                    width: 200
                    height: 200
                    fillMode: Image.PreserveAspectFit
                }
                
                Label {
                    text: "祈福"
                    font.pixelSize: 32
                    font.bold: true
                    color: "#333"
                }
                
                Label {
                    text: "心诚则灵，祈福平安"
                    font.pixelSize: 18
                    color: "#666"
                }
                
                TextArea {
                    placeholderText: "请输入您的祈福愿望..."
                    width: 300
                    height: 100
                    font.pixelSize: 14
                }
                
                Button {
                    text: "提交祈福"
                    font.pixelSize: 16
                    onClicked: {
                        console.log("提交祈福愿望")
                    }
                }
            }
        }
    }

    // 点灯页面
    Component {
        id: lightPage
        Rectangle {
            color: "#fafafa"
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20
                
                Image {
                    source: "qrc:/images/candle.png" // 如果有图片资源的话
                    width: 200
                    height: 200
                    fillMode: Image.PreserveAspectFit
                }
                
                Label {
                    text: "点灯"
                    font.pixelSize: 32
                    font.bold: true
                    color: "#333"
                }
                
                Label {
                    text: "点亮心灯，照亮前程"
                    font.pixelSize: 18
                    color: "#666"
                }
                
                Row {
                    spacing: 20
                    
                    Button {
                        text: "点一盏灯"
                        font.pixelSize: 16
                        onClicked: {
                            console.log("点一盏灯")
                        }
                    }
                    
                    Button {
                        text: "点三盏灯"
                        font.pixelSize: 16
                        onClicked: {
                            console.log("点三盏灯")
                        }
                    }
                    
                    Button {
                        text: "点七盏灯"
                        font.pixelSize: 16
                        onClicked: {
                            console.log("点七盏灯")
                        }
                    }
                }
            }
        }
    }

    // 捐赠页面
    Component {
        id: donatePage
        Rectangle {
            color: "#fafafa"
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20
                
                Image {
                    source: "qrc:/images/donate.png" // 如果有图片资源的话
                    width: 200
                    height: 200
                    fillMode: Image.PreserveAspectFit
                }
                
                Label {
                    text: "捐赠"
                    font.pixelSize: 32
                    font.bold: true
                    color: "#333"
                }
                
                Label {
                    text: "随喜功德，广种福田"
                    font.pixelSize: 18
                    color: "#666"
                }
                
                Row {
                    spacing: 20
                    
                    Button {
                        text: "¥10"
                        font.pixelSize: 16
                        onClicked: {
                            console.log("捐赠10元")
                        }
                    }
                    
                    Button {
                        text: "¥50"
                        font.pixelSize: 16
                        onClicked: {
                            console.log("捐赠50元")
                        }
                    }
                    
                    Button {
                        text: "¥100"
                        font.pixelSize: 16
                        onClicked: {
                            console.log("捐赠100元")
                        }
                    }
                    
                    Button {
                        text: "自定义金额"
                        font.pixelSize: 16
                        onClicked: {
                            console.log("自定义捐赠金额")
                        }
                    }
                }
            }
        }
    }

    // 文件上传功能保留
    Button {
        text: "上传文件"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 20
        onClicked: {
            fileDialog.open()
        }
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        visible: false // 默认隐藏，只在需要时显示
    }

    FileDialog {
        id: fileDialog
        title: "选择文件"
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: {
            image.source = selectedFile
            // pay.saveImagePath(selectedFile) // 注释掉，因为pay不是组件
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
