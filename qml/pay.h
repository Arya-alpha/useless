#ifndef PAY_H
#define PAY_H

#include <QSettings>
#include <QFile>
#include <QObject>

class Pay : public QObject
{
    Q_OBJECT
public:
    Pay(QObject* parent = nullptr);
    ~Pay() = default;

private:
    QString uploadImage();
};

#endif // PAY_H
