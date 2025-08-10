import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    color: "#ffeecc"
    anchors.fill: parent

    Image {
        source: "qrc:/images/pray.png" // 如果有图片资源的话
        width: 200
        height: 200
        fillMode: Image.PreserveAspectFit
    }

    Label {
        anchors.centerIn: parent
        text: "祈福"
        font.pixelSize: 32
        font.bold: true
        color: "#333"
    }

    Label {
        text: "心诚则灵，祈福平安"
        font.pixelSize: 18
        color: "#666"
    }

    TextArea {
        placeholderText: "请输入您的祈福愿望..."
        width: 300
        height: 100
        font.pixelSize: 14
    }

    Button {
        text: "提交祈福"
        font.pixelSize: 16
        onClicked: {
            console.log("提交祈福愿望")
        }
    }
}

// 祈福页面
// Component {
//     id: prayPage
//     Rectangle {
//         color: "#fafafa"

//         ColumnLayout {
//             anchors.centerIn: parent
//             spacing: 20

//             Image {
//                 source: "qrc:/images/pray.png" // 如果有图片资源的话
//                 width: 200
//                 height: 200
//                 fillMode: Image.PreserveAspectFit
//             }

//             Label {
//                 text: "祈福"
//                 font.pixelSize: 32
//                 font.bold: true
//                 color: "#333"
//             }

//             Label {
//                 text: "心诚则灵，祈福平安"
//                 font.pixelSize: 18
//                 color: "#666"
//             }

//             TextArea {
//                 placeholderText: "请输入您的祈福愿望..."
//                 width: 300
//                 height: 100
//                 font.pixelSize: 14
//             }

//             Button {
//                 text: "提交祈福"
//                 font.pixelSize: 16
//                 onClicked: {
//                     console.log("提交祈福愿望")
//                 }
//             }
//         }
//     }
// }
