#ifndef AUDIOPLAYER_H
#define AUDIOPLAYER_H

#include <QObject>

class AudioPlayer : public QObject
{
    Q_OBJECT

public:
    AudioPlayer(QObject *parent = nullptr);
    ~AudioPlayer() = default;
};

#endif // AUDIOPLAYER_H
