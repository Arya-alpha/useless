#ifndef AUDIOPLAYER_H
#define AUDIOPLAYER_H

#include <QObject>
#include <QVariant>
#include <QMediaPlayer>
#include <QAudioOutput>
#include <QUrl>

class AudioPlayer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isPlaying READ isPlaying NOTIFY isPlayingChanged)
    Q_PROPERTY(QString currentTrack READ currentTrack NOTIFY currentTrackChanged)

public:
    AudioPlayer(QObject *parent = nullptr);
    ~AudioPlayer() = default;

    Q_INVOKABLE void play(const QString &musicUrl);
    Q_INVOKABLE void stop();
    Q_INVOKABLE QVariantList getMusicList();
    Q_INVOKABLE void changeMusic(const QString &musicUrl);
    // Q_INVOKABLE void pause();
    // Q_INVOKABLE void resume();
    // Q_INVOKABLE void setVolume(float volume);

    bool isPlaying() const;
    QString currentTrack() const;

signals:
    void isPlayingChanged();
    void currentTrackChanged();

private slots:
    void onMediaStatusChanged(QMediaPlayer::MediaStatus status);
    void onPlaybackStateChanged(QMediaPlayer::PlaybackState state);

private:
    QMediaPlayer *m_player;
    QAudioOutput *m_audioOutput;
    bool m_isPlaying;
    QString m_currentTrack;
};

#endif // AUDIOPLAYER_H
