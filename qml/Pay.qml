import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    color: "#ffeecc"
    anchors.fill: parent

    Image {
        source: "qrc:/images/buddha.png" // 如果有图片资源的话
        width: 200
        height: 200
        fillMode: Image.PreserveAspectFit
    }

    Label {
        anchors.centerIn: parent
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
}
