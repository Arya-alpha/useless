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
        spacing: 20

        Label {
            text: "虔诚礼佛，功德无量"
            font.pixelSize: Math.max(16, parent.width * 0.02)
            color: "#666"
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: parent.height * 0.05
        }

        Image {
            id: image
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: Math.min(0.5 * payColumn.width, 0.6 * payColumn.height)
            Layout.preferredHeight: Layout.preferredWidth * 1.2
            source: "qrc:/Resources/resources/Image/Buddha/default.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }

        Label {
            id: payTimeLabel
            text: "礼佛计时 00:00"
            font.pixelSize: Math.max(16, parent.width * 0.018)
            color: "#666"
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: parent.height * 0.03
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: parent.height * 0.04
            spacing: 20

            Button {
                id: payButton
                text: "开始礼佛"
                font.pixelSize: Math.max(14, parent.width * 0.015)
                Layout.preferredWidth: Math.max(100, parent.width * 0.12)
                Layout.preferredHeight: Math.max(40, parent.height * 0.06)
                hoverEnabled: true
                background: Rectangle {
                    id: payButtonBg
                    border.width: 0
                    radius: payButton.hovered ? 12 : 8
                    color: payButton.hovered ? "#7fe482" : "#66BB6A"
                }

                onClicked: {
                    if (payTime.running) {
                        payTime.stop();
                        payButton.text = "开始礼佛"
                        payButtonBg.color = "#4CAF50"
                    } else {
                        payTime.start();
                        payButton.text = "结束礼佛"
                        payButtonBg.color = "#f44336"
                    }
                }
            }

            Button {
                id: resetButton
                text: "重置计时"
                font.pixelSize: Math.max(14, parent.width * 0.015)
                Layout.preferredWidth: Math.max(100, parent.width * 0.12)
                Layout.preferredHeight: Math.max(40, parent.height * 0.06)
                onClicked: {
                    payTime.stop();
                    payButton.text = "开始礼佛";
                    payButton.color = "#4CAF50";
                    payTimeLabel.text = "礼佛计时 00:00";
                }
            }
        }

        Button {
            text: "上传文件"
            font.pixelSize: Math.max(12, parent.width * 0.012)
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: parent.height * 0.05
            Layout.preferredWidth: Math.max(100, parent.width * 0.12)
            Layout.preferredHeight: Math.max(35, parent.height * 0.05)
            onClicked: {
                fileDialog.open();
            }
        }
    }

    Timer {
        id: payTime
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            var currentText = payTimeLabel.text;
            var timeStr = currentText.split(" ")[1];
            var parts = timeStr.split(":");
            var minutes = parseInt(parts[0]);
            var seconds = parseInt(parts[1]);

            seconds++;
            if (seconds >= 60) {
                seconds = 0;
                minutes++;
            }

            var newTimeStr = (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
            payTimeLabel.text = "礼佛计时 " + newTimeStr;
        }
    }

    FileDialog {
        id: fileDialog
        title: "选择文件"
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: {
            image.source = selectedFile;
        }
        nameFilters: ["所有文件 (*.*)", "图像文件 (*.png *.jpg *.bmp)"]
    }
}
