#ifndef USELESS_H
#define USELESS_H

#include <QMainWindow>
#include <QPushButton>
#include <QLabel>
#include <QMovie>
#include <QPropertyAnimation>
#include <QFileDialog>
#include <QStandardPaths>
#include <QMessageBox>

QT_BEGIN_NAMESPACE
namespace Ui { class UseLess; }
QT_END_NAMESPACE

class UseLess : public QMainWindow
{
    Q_OBJECT

public:
    UseLess(QWidget *parent = nullptr);
    ~UseLess();

private slots:
    void handleOnceButtonClicked();
    void handleTenTimesButtonClicked();
    void handlePushButtonClicked();
    // void on_pushButton_clicked();

private:
    Ui::UseLess *ui;
    QLabel *imageLabel;
    void playGif(const QString &path, int times);
};
#endif
