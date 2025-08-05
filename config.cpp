#include <config.h>

Config::Config()
{
   settings = new QSettings("config.ini", QSettings::IniFormat);
}

Config::~Config()
{
    delete settings;
}

void Config::setImagePath(const QString &imagePath)
{
    settings->setValue("image/imagePath", imagePath);
}

QString Config::getImagePath() const
{
    return settings->value("image/imagePath", "").toString();
}
