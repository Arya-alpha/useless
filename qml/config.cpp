#include <qml/config.h>

Config::Config(QObject *parent)
    : QObject(parent)
{
    settings = new QSettings("config.ini", QSettings::IniFormat);
}

void Config::setCustomPath(const QString &sourcePath)
{
    QSettings settings;
    settings.setValue("image/imagePath", sourcePath);
}

QString Config::getCustomPath()
{
    QSettings settings;
    return settings.value("image/sourcePath").toString();
}
