import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

Rectangle {
    color: "#ffffff"
    anchors.fill: parent

    ColumnLayout {
        id: payColumn
        width: 0.6 * parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Label {
            text: "虔诚礼佛，功德无量"
            font.pixelSize: 18
            color: "#666"
        }

        Image {
            id: image
            width: 0.66 * 0.8 * payColumn.width
            height: 0.8 * payColumn.height
            source: "qrc:/Resources/resources/Image/Buddha/default.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }
    }

    // Label {
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     text: "礼佛"
    //     font.pixelSize: 32
    //     font.bold: true
    //     color: "#333"
    // }

    // Label {
    //     text: "虔诚礼佛，功德无量"
    //     font.pixelSize: 18
    //     color: "#666"
    // }

    Label {
        id: payTimeLabel
        text: "礼佛计时 00:00"
        font.pixelSize: 18
        color: "#666"
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 50
    }

    Button {
        id: payButton
        text: "开始礼佛"
        font.pixelSize: 16
        anchors.centerIn: parent.right
        anchors.verticalCenterOffset: 100
        onClicked: {
            if (payTime.running) {
                // 停止计时
                payTime.stop()
                payButton.text = "开始礼佛"
                payButton.color = "#4CAF50" // 绿色
            } else {
                // 开始计时
                payTime.start()
                payButton.text = "结束礼佛"
                payButton.color = "#f44336" // 红色
            }
        }
    }

    Button {
        id: resetButton
        text: "重置计时"
        font.pixelSize: 14
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 150
        onClicked: {
            payTime.stop()
            payButton.text = "开始礼佛"
            payButton.color = "#4CAF50"
            myLabel.text = "礼佛计时：00:00"
        }
    }

    Timer {
        id: payTime
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            var currentText = myLabel.text;
            var timeStr = currentText.split("：")[1];
            var parts = timeStr.split(":");
            var minutes = parseInt(parts[0]);
            var seconds = parseInt(parts[1]);
            
            seconds++;
            if (seconds >= 60) {
                seconds = 0;
                minutes++;
            }
            
            var newTimeStr = (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
            myLabel.text = "礼佛计时：" + newTimeStr;
        }
    }

    // 文件上传功能保留
    Button {
        text: "上传文件"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 20
        onClicked: {
            fileDialog.open();
        }
    }

    FileDialog {
        id: fileDialog
        title: "选择文件"
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: {
            image.source = selectedFile;
            // pay.saveImagePath(selectedFile) // 注释掉，因为pay不是组件
        }
        nameFilters: ["所有文件 (*.*)", "图像文件 (*.png *.jpg *.bmp)"]
    }
}
