#include "useless.h"
#include "config.h"
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
    Config config;
    QString path = config.getImagePath();
    QPixmap pixmap(path);
    if (pixmap.isNull()) {
        qDebug() << "图片加载失败！";
    }
    label->setPixmap(pixmap);
    label->setScaledContents(true);
    label->move(350, 50);
    label->resize(200, 200);
    label->show();

    connect(ui->onceButton, &QPushButton::clicked, this, &UseLess::handleOnceButtonClicked);
    connect(ui->tenTimesButton, &QPushButton::clicked, this, &UseLess::handleTenTimesButtonClicked);
    connect(ui->pushButton, &QPushButton::clicked, this, &UseLess::handlePushButtonClicked);

    // connect(ui->onceButton, &QPushButton::clicked, this, [=](){
    //     playGif("static/kt.gif", 1);
    // });
    imageLabel = label;
}

UseLess::~UseLess()
{
    delete ui;
}

void UseLess::handleOnceButtonClicked()
{
    playGif("static//kt.gif", 1);
}

void UseLess::handleTenTimesButtonClicked()
{
    playGif("static//kt.gif", 10);
}

void UseLess::handlePushButtonClicked()
{
    QString filePath = QFileDialog::getOpenFileName(this, tr("选择文件"), "", tr("所有文件 (*.*);;图像文件 (*.png *.jpg *.bmp)"));

    if (filePath.isEmpty()) {
        qDebug()<< "用户取消了文件选择";
        return;
    }

    QFileInfo fileInfo(filePath);
    QString fileName = fileInfo.fileName();

    QPixmap pixmap(filePath);
    if (pixmap.isNull()) {
        qDebug() << "上传的图片加载失败！";
        return;
    }

    // Create .useless directory in user's home directory
    QString saveDir = QDir::homePath() + QDir::separator() + ".useless";
    QDir dir;
    if (!dir.exists(saveDir)) {
        dir.mkpath(saveDir);
    }

    QString savePath = saveDir + QDir::separator() + fileName;

    // Save the image
    if (!pixmap.save(savePath)) {
        qDebug() << "图片保存失败！";
    } else {
        qDebug() << "图片已保存到：" << savePath;
    }

    // 设置图片
    imageLabel->setPixmap(pixmap);
    imageLabel->setScaledContents(true);

    Config config;
    config.setImagePath(savePath);
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


// void UseLess::on_pushButton_clicked()
// {
//     QString filePath = QFileDialog::getOpenFileName(this, tr("选择文件"), "", tr("所有文件 (*.*);;图像文件 (*.png *.jpg *.bmp)"));

//     if (filePath.isEmpty()) {
//         qDebug()<< "用户取消了文件选择";
//         return;
//     }

//     QFileInfo fileInfo(filePath);
//     QString fileName = fileInfo.fileName();

//     QPixmap pixmap(filePath);
//     if (pixmap.isNull()) {
//         qDebug() << "上传的图片加载失败！";
//         return;
//     }

//     // Create .useless directory in user's home directory
//     QString saveDir = QDir::homePath() + QDir::separator() + ".useless";
//     QDir dir;
//     if (!dir.exists(saveDir)) {
//         dir.mkpath(saveDir);
//     }

//     QString savePath = saveDir + QDir::separator() + fileName;

//     // Save the image
//     if (!pixmap.save(savePath)) {
//         qDebug() << "图片保存失败！";
//     } else {
//         qDebug() << "图片已保存到：" << savePath;
//     }

//     // 设置图片
//     imageLabel->setPixmap(pixmap);
//     imageLabel->setScaledContents(true);

//     // if (QFile::copy(filePath, savePath)) {
//     //     QMessageBox::information(this, "上传成功", "文件已保存到: " + savePath);
//     // } else {
//     //     QMessageBox::warning(this, "上传失败", "无法复制文件。");
//     // }
// }

// void UseLess::on_background_customContextMenuRequested(const QPoint &pos)
// {

// }


void UseLess::handleTopWindowIconTextChanged(const QString &iconText)
{

}

