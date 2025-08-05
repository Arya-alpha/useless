#ifndef CONFIG_H
#define CONFIG_H

#include <QSettings>

class Config
{
public:
    Config();
    ~Config();

    void setImagePath(const QString &imagePath);
    QString getImagePath() const;

private:
    QSettings *settings;
};

#endif
