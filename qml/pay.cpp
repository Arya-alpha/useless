#include <qml/pay.h>
#include <qml/config.h>

Pay::Pay(QObject *parent)
    : QObject(parent)
{
}

void Pay::saveImagePath(const QString &sourcePath) {
    qDebug() << "sourcePath" << sourcePath;
    Config config;
    config.setCustomPath(sourcePath);

    // qDebug() << "上传文件";

    // QString localPath = "./static";
    // QFile *file = new QFile(localPath);
    // if (!file->open(QIODevice::ReadOnly)) {
    //     qDebug() << "无法打开文件";
    //     delete file;
    // }
    // QString imagePath = QFileDialog::getOpenFileName(this, tr("选择文件"), "", tr("所有文件 (*.*);;图像文件 (*.png *.jpg *.bmp)"));
}
