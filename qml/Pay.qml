import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Shapes

Rectangle {
    color: "#ffffff"
    anchors.fill: parent

    property var musicList: audioPlayer.getMusicList()
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
        width: 0.95 * parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        anchors {
            fill: parent
            margins: 10
        }

        // choose buddha
        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width * 0.2
            spacing: 15

            ColumnLayout {
                // columns: 1
                // rowSpacing: 15
                // columnSpacing: 10
                // Layout.fillWidth: true
                // Layout.horizontalCenter: true
                Layout.alignment: Qt.AlignHCenter

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
            //     text:
            //     font.pixelSize: Math.max(16, parent.width * 0.02)
            //     color: "#666"
            //     Layout.alignment: Qt.AlignHCenter
            //     Layout.topMargin: parent.height * 0.03
            // }

            Image {
                id: image
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: Math.min(parent.width, 0.8 * parent.height)
                Layout.preferredHeight: Layout.preferredWidth * 1.2
                source: "qrc:/Resources/resources/Image/Buddha3D/shakyamuni.png"
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

                Rectangle {
                    id: audioPlayerController
                    anchors.centerIn: parent
                    width: parent.width
                    height: 0.2 * parent.height
                    color: "#ffffff"
                    border.width: 1
                    border.color: "#000000"
                    radius: 8

                    // property var currentMusicUrl: userConfig.getCurrentMusicUrl
                    // get music list from resources
                    property var musicList: audioPlayer.getMusicList()

                    // music player controller
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Text {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.alignment: Qt.AlignVCenter
                            text: audioPlayer.isPlaying ? ("当前正在播放《" + audioPlayerController.currentMusicName + "》") : "当前暂无正在播放的音乐"
                            color: "#000000"
                            font.pixelSize: Math.max(12, parent.width * 0.01)
                            wrapMode: Text.WordWrap
                        }

                        Button {
                            id: audioPlayButton
                            Layout.preferredWidth: 40
                            Layout.preferredHeight: 40
                            Layout.alignment: Qt.AlignVCenter
                            display: AbstractButton.IconOnly
                            icon.width: 24
                            icon.height: 24
                            icon.source: audioPlayer.playing ? "qrc:/Resources/resources/Image/button/stop.png" : "qrc:/Resources/resources/Image/button/start.png"

                            background: Rectangle {
                                color: parent.hovered ? "#f0f0f0" : "transparent"
                                radius: 4
                            }

                            onClicked: {
                                audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play("qrc:/Resources/resources/Music/南无阿弥陀佛.mp3")
                            }

                            // if (audioPlayer.isPlaying) {
                            //     audioPlayer.stop();
                            // } else {
                            //     // Play the default music
                            //     audioPlayer.play("qrc:/Resources/resources/Music/南无阿弥陀佛.mp3");
                            //     audioPlayerController.currentMusicName = "南无阿弥陀佛";
                            // }
                        }

                        // Button {
                        //     id: listButton
                        //     Layout.preferredWidth: 40
                        //     Layout.preferredHeight: 40
                        //     Layout.alignment: Qt.AlignVCenter
                        //     display: AbstractButton.IconOnly
                        //     icon.width: 24
                        //     icon.height: 24
                        //     icon.source: "qrc:/Resources/resources/Image/button/list.png"

                        //     onClicked: {
                        //         musicListPopup.width = audioPlayerController.width;
                        //         musicListPopup.height = 50;
                        //         const p = audioPlayerController.mapToItem(null, 0, audioPlayerController.height);

                        //         // musicListPopup.x = 933;
                        //         // musicListPopup.y = 132.6 + 50;
                        //         musicListCombo.open();
                        //     }
                        // }

                        ComboBox {
                            id: musicListCombo
                            Layout.preferredWidth: 40
                            Layout.preferredHeight: 40
                            Layout.alignment: Qt.AlignVCenter
                            // width: 200
                            model: musicList
                            textRole: "name"
                            contentItem: Item {}
                            onActivated: index => console.log("选中：", model[index])
                            // Item: {}
                            background: Image {
                                width: 24
                                height: 24

                                // anchors.fill: parent
                                source: "qrc:/Resources/resources/Image/button/list.png"
                                fillMode: Image.PreserveAspectFit
                            }

                            indicator: null

                            // Repeater {
                            //     model: audioPlayer.getMusicList()

                            //     ColumnLayout {
                            //         Layout.fillWidth: true
                            //         Layout.fillHeight: true
                            //         spacing: 10

                            //         Text {
                            //             text: modelData.name
                            //         }
                            //     }
                            // }
                        }
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: 0.8 * parent.width
                Layout.preferredHeight: 0.2 * parent.height
                color: "#ffffff"
                border.width: 1
                border.color: "#000000"
                radius: 8

                property var musicList: audioPlayer.getMusicList()

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 5

                    Text {
                        text: "选择佛音"
                        font.pixelSize: Math.max(12, parent.width * 0.015)
                        color: "#333"
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Repeater {
                        model: musicList

                        Button {
                            width: ListView.view.width
                            height: 25
                            text: modelData.name
                            font.pixelSize: Math.max(10, parent.width * 0.01)

                            background: Rectangle {
                                color: parent.hovered ? "#F7DAA1" : "#ffffff"
                                border.width: 1
                                border.color: "#ddd"
                                radius: 4
                            }
                        }
                    }

                    // ListView {
                    //     Layout.fillWidth: true
                    //     Layout.fillHeight: true
                    //     model: musicList
                    //     spacing: 2

                    //     delegate: Button {
                    //         width: ListView.view.width
                    //         height: 25
                    //         text: modelData.name
                    //         font.pixelSize: Math.max(10, parent.width * 0.01)

                    //         background: Rectangle {
                    //             color: parent.hovered ? "#F7DAA1" : "#ffffff"
                    //             border.width: 1
                    //             border.color: "#ddd"
                    //             radius: 4
                    //         }

                    //         onClicked: {
                    //             audioPlayer.play(modelData.file);
                    //             audioPlayerController.currentMusicName = modelData.name;
                    //         }
                    //     }
                    // }
                }
            }

            Rectangle {
                Layout.preferredWidth: 0.8 * parent.width
                Layout.preferredHeight: 0.5 * parent.height
                color: "#ffffff"
                border.width: 1
                border.color: "#000000"
                radius: 8

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Text {
                        text: "音量控制"
                        font.pixelSize: Math.max(12, parent.width * 0.015)
                        color: "#333"
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Slider {
                        id: volumeSlider
                        Layout.fillWidth: true
                        Layout.preferredHeight: 30
                        from: 0.0
                        to: 1.0
                        value: 0.7
                        stepSize: 0.1

                        onValueChanged: {
                            audioPlayer.setVolume(value);
                        }

                        background: Rectangle {
                            x: volumeSlider.leftPadding
                            y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                            implicitWidth: 200
                            implicitHeight: 4
                            width: volumeSlider.availableWidth
                            height: implicitHeight
                            radius: 2
                            color: "#bdbebf"

                            Rectangle {
                                width: volumeSlider.visualPosition * parent.width
                                height: parent.height
                                color: "#F7DAA1"
                                radius: 2
                            }
                        }

                        handle: Rectangle {
                            x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.availableWidth - width)
                            y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                            implicitWidth: 20
                            implicitHeight: 20
                            radius: 10
                            color: volumeSlider.pressed ? "#D4CAB6" : "#F7DAA1"
                            border.color: "#bdbebf"
                        }
                    }

                    Text {
                        text: "音量: " + Math.round(volumeSlider.value * 100) + "%"
                        font.pixelSize: Math.max(10, parent.width * 0.012)
                        color: "#666"
                        Layout.alignment: Qt.AlignHCenter
                    }

                    // Additional playback controls
                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 10

                        Button {
                            text: "暂停"
                            enabled: audioPlayer.isPlaying
                            font.pixelSize: Math.max(10, parent.width * 0.01)
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 30

                            background: Rectangle {
                                color: parent.enabled ? (parent.hovered ? "#D4CAB6" : "#F7DAA1") : "#f0f0f0"
                                border.width: 1
                                border.color: "#ddd"
                                radius: 4
                            }

                            onClicked: {
                                audioPlayer.pause();
                            }
                        }

                        Button {
                            text: "停止"
                            enabled: audioPlayer.isPlaying
                            font.pixelSize: Math.max(10, parent.width * 0.01)
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 30

                            background: Rectangle {
                                color: parent.enabled ? (parent.hovered ? "#D4CAB6" : "#F7DAA1") : "#f0f0f0"
                                border.width: 1
                                border.color: "#ddd"
                                radius: 4
                            }

                            onClicked: {
                                audioPlayer.stop();
                            }
                        }
                    }
                }
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
