import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    color: "#ffeecc"
    anchors.fill: parent

    Image {
        id: image
        width: 0.66 * 0.8 * parent.height
        height: 0.8 * parent.height
        source: "qrc:/Resources/resources/Image/Buddha/default.png"
        fillMode: Image.PreserveAspectFit
        visible: true
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
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
