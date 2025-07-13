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
    label->resize(300, 300);
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

