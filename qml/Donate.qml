import QtQuick
import QtQuick.Controls

Rectangle {
    color: "#ffeecc"
    anchors.fill: parent

    Image {
        source: "qrc:/images/donate.png" // 如果有图片资源的话
        width: 200
        height: 200
        fillMode: Image.PreserveAspectFit
    }

    Label {
        text: "捐赠"
        font.pixelSize: 32
        font.bold: true
        color: "#333"
    }

    Label {
        text: "随喜功德，广种福田"
        font.pixelSize: 18
        color: "#666"
    }

    Row {
        spacing: 20

        Button {
            text: "¥10"
            font.pixelSize: 16
            onClicked: {
                console.log("捐赠10元")
            }
        }

        Button {
            text: "¥50"
            font.pixelSize: 16
            onClicked: {
                console.log("捐赠50元")
            }
        }

        Button {
            text: "¥100"
            font.pixelSize: 16
            onClicked: {
                console.log("捐赠100元")
            }
        }

        Button {
            text: "自定义金额"
            font.pixelSize: 16
            onClicked: {
                console.log("自定义捐赠金额")
            }
        }
    }
}
