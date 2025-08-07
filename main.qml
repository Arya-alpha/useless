import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

import "qml"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Button {
        text: "上传文件"
        anchors.centerIn: parent
        onClicked: {
            pay.uploadImage()
        }
    }
}
