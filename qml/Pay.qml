import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Shapes

Rectangle {
    id: content
    color: "#ffffff"
    anchors.fill: parent

    property var currentBuddha: buddhaList[0]
    property var buddhaList: [
        {
            "id": "shakyamuni",
            "path": "shakyamuni.png",
            "name": "释迦牟尼佛",
            "total": "南无本师释迦牟尼佛"
        },
        {
            "id": "amitabha",
            "path": "amitabha.png",
            "name": "阿弥陀佛",
            "total": "南无阿弥陀佛"
        },
        {
            "id": "medicine",
            "path": "medicine.png",
            "name": "药师佛",
            "total": "南无消灾延寿药师佛"
        },
        {
            "id": "maitreya",
            "path": "maitreya.png",
            "name": "弥勒佛",
            "total": "南无当来下生弥勒尊佛"
        },
        {
            "id": "guanyin",
            "path": "guanyin.png",
            "name": "观世音菩萨",
            "total": "南无大慈大悲观世音菩萨"
        },
        {
            "id": "ksitigarbha",
            "path": "ksitigarbha.png",
            "name": "地藏王菩萨",
            "total": "南无大愿地藏王菩萨"
        },
        {
            "id": "manjushri",
            "path": "manjushri.png",
            "name": "文殊菩萨",
            "total": "南无大智文殊师利菩萨"
        },
        {
            "id": "samantabhadra",
            "path": "samantabhadra.png",
            "name": "普贤菩萨",
            "total": "南无大行普贤菩萨"
        },
        {
            "id": "mahasthamaprapta",
            "path": "mahasthamaprapta.png",
            "name": "大势至菩萨",
            "total": "南无大势至菩萨"
        },
        {
            "id": "cundi",
            "path": "cundi.png",
            "name": "准提菩萨",
            "total": "南无准提菩萨"
        }
    ]
    property var currentAudioUrl: userConfig.getCurrentMusicUrl
    property var audioList: audioPlayer.getMusicList()

    RowLayout {
        anchors.fill: parent
        spacing: 10

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 0.15 * content.width

            ColumnLayout {
                id: buddhaListColumn
                Layout.fillWidth: true
                Layout.fillHeight: true
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 6

                Repeater {
                    model: buddhaList

                    delegate: Button {
                        text: modelData.name

                        Layout.preferredWidth: 125
                        Layout.preferredHeight: 40
                        Layout.topMargin: index === 0 ? 20 : 0
                        font.pixelSize: 12
                        hoverEnabled: false

                        background: Rectangle {
                            anchors.fill: parent
                            anchors.margins: 6
                            border.width: 0
                            radius: 8
                            color: buddhaHover.hovered ? "#D4CAB6" : "#F7DAA1"

                            Behavior on color {
                                ColorAnimation {
                                    duration: 150
                                }
                            }
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

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 0.65 * content.width

            ColumnLayout {
                id: buddhaImage
                Layout.fillWidth: true
                Layout.fillHeight: true
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 6

                Text {
                    text: currentBuddha.total
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 20
                    font.pixelSize: 20
                    color: "#666"
                }

                Image {
                    id: image
                    Layout.preferredHeight: 0.8 * content.height
                    fillMode: Image.PreserveAspectFit
                    Layout.alignment: Qt.AlignHCenter
                    source: "qrc:/Resources/resources/Image/Buddha3D/" + currentBuddha.path
                    visible: true
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 0.2 * content.width

            ColumnLayout {
                Layout.fillWidth: true
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 12

                // 音频主面板
                Rectangle {
                    id: audioContent

                    Layout.fillWidth: true
                    Layout.preferredHeight: 45
                    Layout.topMargin: 20

                    color: "#ffffff"
                    border.width: 1
                    border.color: "#000000"
                    radius: 8

                    Text {
                        text: audioPlayer.isPlaying ? ("当前正在播放《" + audioPlayerController.currentMusicName + "》") : "当前暂无正在播放的音乐"
                        anchors.centerIn: parent
                        visible: !audioPlayerHover.hovered
                        color: "#000000"
                        font.pixelSize: Math.max(12, parent.width * 0.01)
                        // wrapMode: Text.WordWrap
                    }

                    // 音频控制面板，仅在悬停时显示
                    RowLayout {
                        id: audioControl
                        anchors.fill: parent
                        // anchors.margins: 10
                        spacing: 10
                        visible: audioPlayerHover.hovered
                        // Text {
                        //     Layout.fillWidth: true
                        //     Layout.fillHeight: true
                        //     Layout.alignment: Qt.AlignVCenter
                        //     text: audioPlayer.isPlaying ? ("当前正在播放《" + audioPlayerController.currentMusicName + "》") : "当前暂无正在播放的音乐"
                        //     color: "#000000"
                        //     font.pixelSize: Math.max(12, parent.width * 0.01)
                        //     wrapMode: Text.WordWrap
                        // }

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
                                audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play(currentMusicUrl);
                            }
                        }

                        ComboBox {
                            id: musicListCombo
                            Layout.preferredWidth: 40
                            Layout.preferredHeight: 40
                            Layout.alignment: Qt.AlignVCenter
                            // width: 200
                            model: audioList
                            textRole: "name"
                            contentItem: Item {}
                            onActivated: index => console.log("选中：", model[index])
                            background: Image {
                                width: 24
                                height: 24
                                source: "qrc:/Resources/resources/Image/button/list.png"
                                fillMode: Image.PreserveAspectFit
                            }

                            indicator: null
                        }
                    }

                    HoverHandler {
                        id: audioPlayerHover
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                // }

                Rectangle {
                    Layout.preferredWidth: 0.8 * 0.2 * content.width
                    Layout.preferredHeight: 0.8 * content.height
                    color: "#ffffff"
                    border.width: 1
                    border.color: "#000000"
                    radius: 8

                    GridLayout {
                        anchors.fill: parent
                        columns: 2
                        rowSpacing: 15
                        columnSpacing: 15

                        Text {
                            text: "祈愿主题"
                            Layout.row: 0
                            Layout.column: 0
                            font.pixelSize: Math.max(12, parent.width * 0.015)
                        }

                        Rectangle {
                            Layout.row: 0
                            Layout.column: 1
                            width: 100
                            height: 100
                            color: "#ffffff"
                            border.width: 1
                            border.color: "#000000"
                            radius: 8
                        }
                    }
                }
            }
        }
    }

    // Label {
    //     id: payTimeLabel
    //     text: "礼佛计时 00:00"
    //     font.pixelSize: Math.max(16, parent.width * 0.018)
    //     color: "#666"
    //     Layout.alignment: Qt.AlignHCenter
    //     Layout.topMargin: parent.height * 0.02
    // }

    // Button {
    //     text: "上传文件"
    //     font.pixelSize: Math.max(12, parent.width * 0.012)
    //     Layout.alignment: Qt.AlignHCenter
    //     Layout.preferredWidth: Math.max(80, parent.width * 0.15)
    //     Layout.preferredHeight: Math.max(30, parent.height * 0.04)
    //     onClicked: {
    //         fileDialog.open();
    //     }
    // }

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
