import QtQuick

// // 点灯页面
// Component {
//     id: lightPage
//     Rectangle {
//         color: "#fafafa"

//         ColumnLayout {
//             anchors.centerIn: parent
//             spacing: 20

//             Image {
//                 source: "qrc:/images/candle.png" // 如果有图片资源的话
//                 width: 200
//                 height: 200
//                 fillMode: Image.PreserveAspectFit
//             }

//             Label {
//                 text: "点灯"
//                 font.pixelSize: 32
//                 font.bold: true
//                 color: "#333"
//             }

//             Label {
//                 text: "点亮心灯，照亮前程"
//                 font.pixelSize: 18
//                 color: "#666"
//             }

//             Row {
//                 spacing: 20

//                 Button {
//                     text: "点一盏灯"
//                     font.pixelSize: 16
//                     onClicked: {
//                         console.log("点一盏灯")
//                     }
//                 }

//                 Button {
//                     text: "点三盏灯"
//                     font.pixelSize: 16
//                     onClicked: {
//                         console.log("点三盏灯")
//                     }
//                 }

//                 Button {
//                     text: "点七盏灯"
//                     font.pixelSize: 16
//                     onClicked: {
//                         console.log("点七盏灯")
//                     }
//                 }
//             }
//         }
//     }
// }
