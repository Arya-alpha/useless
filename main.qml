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

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: leftBox
            Layout.preferredWidth: window.width * 0.1
            Layout.fillHeight: true
            visible: true
            color: "#E5DFD1"
            border.color: "#ddd"
            border.width: 1

            Component {
                id: contactDelegate
                Rectangle {
                    id: menuItem
                    required property string name
                    required property string page
                    required property int index
                    property bool mouseHover: false
                    width: leftBox.width - menuList.anchors.margins * 2
                    // height: (leftBox.height - menuList.anchors.margins * 2 - menuList.spacing * (menuList.count - 1)) / menuList.count
                    height: 0.06 * (leftBox.height - menuList.anchors.margins * 2)
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: ListView.isCurrentItem ? "#CABFA4" : (mouseHover ? "#F7DAA1" : "transparent")
                    radius: 8

                    Text {
                        anchors.centerIn: parent
                        text: menuItem.name
                        font.pixelSize: 18
                        font.bold: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onEntered: menuItem.mouseHover = true
                        onExited: menuItem.mouseHover = false
                        onClicked: {
                            contentLoader.source = menuItem.page
                            menuList.currentIndex = index
                        }
                    }
                }
            }

            ListView {
                id: menuList
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10
                model: ListModel {
                    ListElement {
                        name: "礼佛"
                        page: "qml/Pay.qml"
                    }
                    ListElement {
                        name: "心愿"
                        page: "qml/Pray.qml"
                    }
                    ListElement {
                        name: "功德"
                        page: "qml/Light.qml"
                    }
                    ListElement {
                        name: "设置"
                        page: "qml/Donate.qml"
                    }
                }
                delegate: contactDelegate
                // highlightMoveDuration: 0
                // highlight: Rectangle {
                //     color: "lightsteelblue"
                //     radius: 5
                // }
                focus: true
            }
        }

        Loader {
            id: contentLoader
            Layout.fillWidth: true
            Layout.fillHeight: true
            source: "qml/Pay.qml"
        }
    }
}
