#include <qml/pay.h>

Pay::Pay(QObject *parent)
    : QObject(parent)
{

}

QString Pay::uploadImage() {
    qDebug() << "上传文件";

    QString localPath = "./static";
    QFile *file = new QFile(localPath);
    if (!file->open(QIODevice::ReadOnly)) {
        qDebug() << "无法打开文件";
        delete file;
    }
    // QString imagePath = QFileDialog::getOpenFileName(this, tr("选择文件"), "", tr("所有文件 (*.*);;图像文件 (*.png *.jpg *.bmp)"));

    return localPath;
}
