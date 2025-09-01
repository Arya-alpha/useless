#ifndef CONFIG_H
#define CONFIG_H

#include <QSettings>

class Config : public QObject
{
    Q_OBJECT

public:
    Config(QObject* parent = nullptr);
    ~Config() = default;

    Q_INVOKABLE void setCustomPath(const QString &sourcePath);
    Q_INVOKABLE QString getCustomPath();
    Q_INVOKABLE void setCurrentMusicUrl(const QString &musicUrl);
    Q_INVOKABLE QString getCurrentMusicUrl();

private:
    QSettings *settings;
};

#endif // CONFIG_H
