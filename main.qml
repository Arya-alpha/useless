import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

// import "qml"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Button {
        text: "上传文件"
        anchors.centerIn: parent
        onClicked: {
            fileDialog.open()
        }
    }

    FileDialog {
        id: fileDialog
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: image.source = selectedFile
        nameFilters: ["所有文件 (*.*)", "图像文件 (*.png *.jpg *.bmp)"]
    }
}
