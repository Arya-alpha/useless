#include "useless.h"
#include "ui_useless.h"

#include <QParallelAnimationGroup>
#include <QPixmap>
#include <QDebug>
#include <QDir>

UseLess::UseLess(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::UseLess)
{
    ui->setupUi(this);

//    qDebug() << QDir::currentPath();
    QLabel *label = new QLabel(this);
    QPixmap pixmap("static//junLei.png");
    if (pixmap.isNull()) {
        qDebug() << "图片加载失败！";
    }
    label->setPixmap(pixmap);
    label->setScaledContents(true);
    label->move(350, 50);
    label->resize(200, 200);
    label->show();
}

UseLess::~UseLess()
{
    delete ui;
}

void UseLess::on_onceButton_clicked()
{
    playGif("static//kt.gif", 1);
}

void UseLess::on_tenTimesButton_clicked()
{
    playGif("static//kt.gif", 10);
}

void UseLess::playGif(const QString &path, int times)
{
    QLabel *label = new QLabel(this);
    label->setGeometry(100, 200, 200, 150);
    label->setScaledContents(true);

    QMovie *movie = new QMovie(path);
    label->setMovie(movie);
    label->show();

    int *currentLoopCount = new int(0);
    int totalLoopCount = movie->frameCount();
    if (totalLoopCount <= 0)
    {
        totalLoopCount = times;
    }

    connect(movie, &QMovie::frameChanged, this, [=](int frameNumber) mutable {
        if (frameNumber == totalLoopCount - 1) {
            (*currentLoopCount)++;
            if (*currentLoopCount >= times) {
                label->hide();
                movie->stop();
                movie->deleteLater();
                delete currentLoopCount;
            } else {
                movie->start();
            }
        }
    });

    movie->start();
}


void UseLess::on_pushButton_clicked()
{
    QString filePath = QFileDialog::getOpenFileName(this, tr("选择文件"), "", tr("所有文件 (*.*);;图像文件 (*.png *.jpg *.bmp)"));
    if (!filePath.isEmpty()) {
        qDebug()<< "图片上传失败！";
    }

    QFileInfo fileInfo(filePath);
    QString fileName = fileInfo.fileName();
    QString destDir = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation);
    QString savePath = destDir + fileName;

    if (QFile::copy(filePath, savePath)) {
        QMessageBox::information(this, "上传成功", "文件已保存到: " + savePath);
    } else {
        QMessageBox::warning(this, "上传失败", "无法复制文件。");
    }
}
