import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Shapes

Rectangle {
    color: "#ffffff"
    anchors.fill: parent

    property var buddhaList: [
        {
            "id": "shakyamuni",
            "path": "shakyamuni.png",
            "name_cn": "释迦牟尼佛",
            "name_en": "Shakyamuni Buddha",
            "buddha_name": "南无本师释迦牟尼佛"
        },
        {
            "id": "amitabha",
            "path": "amitabha.png",
            "name_cn": "阿弥陀佛",
            "name_en": "Amitabha Buddha",
            "buddha_name": "南无阿弥陀佛"
        },
        {
            "id": "medicine",
            "path": "medicine.png",
            "name_cn": "药师佛",
            "name_en": "Bhaisajyaguru (Medicine Buddha)",
            "buddha_name": "南无消灾延寿药师佛"
        },
        {
            "id": "maitreya",
            "path": "maitreya.png",
            "name_cn": "弥勒佛",
            "name_en": "Maitreya Buddha",
            "buddha_name": "南无当来下生弥勒尊佛"
        },
        {
            "id": "guanyin",
            "path": "guanyin.png",
            "name_cn": "观世音菩萨",
            "name_en": "Avalokiteshvara (Guanyin Bodhisattva)",
            "buddha_name": "南无大慈大悲观世音菩萨"
        },
        {
            "id": "ksitigarbha",
            "path": "ksitigarbha.png",
            "name_cn": "地藏王菩萨",
            "name_en": "Kṣitigarbha (Ksitigarbha Bodhisattva)",
            "buddha_name": "南无大愿地藏王菩萨"
        },
        {
            "id": "manjushri",
            "path": "manjushri.png",
            "name_cn": "文殊菩萨",
            "name_en": "Manjushri Bodhisattva",
            "buddha_name": "南无大智文殊师利菩萨"
        },
        {
            "id": "samantabhadra",
            "path": "samantabhadra.png",
            "name_cn": "普贤菩萨",
            "name_en": "Samantabhadra Bodhisattva",
            "buddha_name": "南无大行普贤菩萨"
        },
        {
            "id": "mahasthamaprapta",
            "path": "mahasthamaprapta.png",
            "name_cn": "大势至菩萨",
            "name_en": "Mahasthamaprapta Bodhisattva",
            "buddha_name": "南无大势至菩萨"
        },
        {
            "id": "cundi",
            "path": "cundi.png",
            "name_cn": "准提菩萨",
            "name_en": "Cundi Bodhisattva",
            "buddha_name": "南无准提菩萨"
        }
    ]

    RowLayout {
        id: mainRow
        width: 0.95 * parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: 10
        }

        // choose buddha
        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width * 0.2
            spacing: 15

            GridLayout {
                columns: 1
                rowSpacing: 15
                columnSpacing: 10
                Layout.fillWidth: true

                Repeater {
                    model: buddhaList

                    Button {
                        text: modelData.name_cn
                        font.pixelSize: Math.max(10, parent.width * 0.008)
                        Layout.fillWidth: true
                        Layout.preferredHeight: Math.max(30, parent.height * 0.04)
                        hoverEnabled: false

                        background: Rectangle {
                            width: Math.max(20, parent.width * 0.5)
                            anchors.horizontalCenter: parent.horizontalCenter
                            border.width: 0
                            radius: 6
                            color: buddhaHover.hovered ? "#D4CAB6" : "#F7DAA1"

                            Behavior on color {
                                ColorAnimation {
                                    duration: 150
                                }
                            }
                        }

                        contentItem: Text {
                            text: parent.text
                            font.pixelSize: parent.font.pixelSize
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }

                        HoverHandler {
                            id: buddhaHover
                            cursorShape: Qt.PointingHandCursor
                        }

                        onClicked: {
                            image.source = "qrc:/Resources/resources/Image/Buddha3D/" + modelData.path;
                        }
                    }
                }
            }
        }

        // buddha 3D image
        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width * 0.5
            spacing: 15

            // Label {
            //     text: "虔诚礼佛，功德无量"
            //     font.pixelSize: Math.max(16, parent.width * 0.02)
            //     color: "#666"
            //     Layout.alignment: Qt.AlignHCenter
            //     Layout.topMargin: parent.height * 0.03
            // }

            Image {
                id: image
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: Math.min(0.8 * (parent.width), 0.5 * parent.height)
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
                Layout.topMargin: parent.height * 0.02
            }

            Button {
                text: "上传文件"
                font.pixelSize: Math.max(12, parent.width * 0.012)
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: Math.max(80, parent.width * 0.15)
                Layout.preferredHeight: Math.max(30, parent.height * 0.04)
                onClicked: {
                    fileDialog.open();
                }
            }
        }

        // audio control and pay control
        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width * 0.3
            spacing: 15

            Rectangle {
                Layout.preferredWidth: 0.8 * parent.width
                Layout.fillHeight: true
                // color: "#ffffff"
                // border.width: 1
                // border.color: "#000000"
                // radius: 8

                Rectangle {
                    id: audioPlayerController
                    anchors.centerIn: parent
                    width: parent.width
                    height: 0.2 * parent.height
                    color: "#ffffff"
                    border.width: 1
                    border.color: "#000000"
                    radius: 8

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Text {
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignVCenter
                            // Layout.preferredWidth: 0.5 * parent.width
                            Layout.fillHeight: true
                            text: "当前正在播放《"
                            color: "#000000"
                            font.pixelSize: Math.max(12, parent.width * 0.01)
                        }

                        Button {
                            id: audioPlayButton
                            Layout.preferredWidth: 44
                            Layout.preferredHeight: 44
                            Layout.alignment: Qt.AlignVCenter
                            display: AbstractButton.IconOnly
                            icon.source: "qrc:/Resources/resources/Image/button/start.png"
                            icon.width: 24
                            icon.height: 24

                            // Layout.preferredWidth: Math.max(20, 0.8 * parent.width)
                            // Layout.fillHeight: true

                            // onClicked: {
                            //     if (start) {

                            //     }
                            // }
                        }
                    }


                }

                // RowLayout {
                //     Layout.fillWidth: true
                //     Layout.preferredWidth: 6
                //     Layout.preferredHeight: parent.height

                //     Rectangle {
                //         Layout.fillWidth: true
                //         Layout.preferredWidth: 0.6 * parent.width
                //         Layout.preferredHeight: Math.max(30, parent.height * 0.06)
                //         color: "#ffffff"
                //         border.width: 1
                //         border.color: "#000000"
                //         radius: 8
                //     }

                //     ToolButton {
                //         text: player.playbackState === MediaPlayer.PlayingState ? "⏸" : "▶"
                //     }
                // }

                // Rectangle {
                //     id: playButton
                //     Layout.alignment: Qt.AlignHCenter
                //     Layout.preferredWidth: 0.8 * parent.width
                //     Layout.preferredHeight: 0.8 * parent.height
                //     color: "#f0f0f0"
                //     radius: 8
                //     Shape {
                //         anchors.centerIn: parent
                //         width: 0.8 * parent.width
                //         height: 0.8 * parent.height

                //         ShapePath {
                //             strokeColor: "transparent"
                //             fillColor: "#666"
                //             PathLine {
                //                 x: 0
                //                 y: 0
                //             }
                //             PathLine {
                //                 x: 30
                //                 y: 15
                //             }
                //             PathLine {
                //                 x: 0
                //                 y: 30
                //             }
                //         }
                //     }
                // }
            }

            Rectangle {
                Layout.preferredWidth: 0.8 * parent.width
                Layout.preferredHeight: 0.2 * parent.height
                color: "#ffffff"
                border.width: 1
                border.color: "#000000"
                radius: 8
            }

            Rectangle {
                Layout.preferredWidth: 0.8 * parent.width
                Layout.preferredHeight: 0.5 * parent.height
                color: "#ffffff"
                border.width: 1
                border.color: "#000000"
                radius: 8
            }

            // ColumnLayout {
            //     id: audioPlayerControl
            //     Layout.fillWidth: parent
            //     Layout.preferredHeight: 0.3 * parent.height
            //     spacing: 10
            // }

            // Label {
            //     text: "礼佛控制"
            //     font.pixelSize: Math.max(18, parent.width * 0.025)
            //     color: "#333"
            //     Layout.alignment: Qt.AlignHCenter
            //     Layout.topMargin: parent.height * 0.03
            // }

            // Button {
            //     id: payButton
            //     text: "开始礼佛"
            //     font.pixelSize: Math.max(14, parent.width * 0.015)
            //     Layout.fillWidth: true
            //     Layout.preferredHeight: Math.max(40, parent.height * 0.06)
            //     hoverEnabled: false
            //     background: Rectangle {
            //         id: payButtonBg
            //         border.width: payButtonHoverHandler.hovered ? 1 : 0
            //         border.color: payButtonHoverHandler.hovered ? "#968e8c" : "#ffffff"
            //         radius: 8
            //         color: payTime.running ? (payButtonHoverHandler.hovered ? "#FF5722" : "#f44336") : (payButtonHoverHandler.hovered ? "#66BB6A" : "#4CAF50")
            //     }

            //     HoverHandler {
            //         id: payButtonHoverHandler
            //         cursorShape: Qt.PointingHandCursor
            //     }

            //     onClicked: {
            //         if (payTime.running) {
            //             payTime.stop();
            //             payButton.text = "开始礼佛";
            //             payButtonBg.color = "#4CAF50";
            //         } else {
            //             payTime.start();
            //             payButton.text = "结束礼佛";
            //             payButtonBg.color = "#f44336";
            //         }
            //     }
            // }

            // Button {
            //     id: resetButton
            //     text: "重置计时"
            //     font.pixelSize: Math.max(14, parent.width * 0.015)
            //     Layout.fillWidth: true
            //     Layout.preferredHeight: Math.max(40, parent.height * 0.06)
            //     background: Rectangle {
            //         radius: hh.hovered ? 20 : 12
            //         color: hh.hovered ? "#FF8A65" : "#FF7043"
            //         border.color: hh.hovered ? "#BF360C" : "#D84315"
            //         border.width: 1

            //         Behavior on color {
            //             ColorAnimation {
            //                 duration: 140
            //             }
            //         }
            //         Behavior on radius {
            //             NumberAnimation {
            //                 duration: 140
            //             }
            //         }
            //     }

            // contentItem: Text {
            //     text: resetButton.text
            //     font.pixelSize: resetButton.font.pixelSize
            //     color: "white"
            //     horizontalAlignment: Text.AlignHCenter
            //     verticalAlignment: Text.AlignVCenter
            //     elide: Text.ElideRight
            // }

            // HoverHandler {
            //     id: hh
            //     cursorShape: Qt.PointingHandCursor
            // }

            // onClicked: {
            //     payTime.stop();
            //     payButton.text = "开始礼佛";
            //     payButtonBg.color = "#4CAF50";
            //     payTimeLabel.text = "礼佛计时 00:00";
            // }
            // }
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
