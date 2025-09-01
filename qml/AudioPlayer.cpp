#include "AudioPlayer.h"
#include <QCoreApplication>
#include <QDir>
#include <QDebug>

AudioPlayer::AudioPlayer(QObject *parent)
    : QObject(parent), m_isPlaying(false), m_currentTrack("")
{
    m_player = new QMediaPlayer(this);
    m_audioOutput = new QAudioOutput(this);
    m_player->setAudioOutput(m_audioOutput);
    
    // Set default volume
    m_audioOutput->setVolume(0.7f);
    
    // Connect signals
    connect(m_player, &QMediaPlayer::mediaStatusChanged, this, &AudioPlayer::onMediaStatusChanged);
    connect(m_player, &QMediaPlayer::playbackStateChanged, this, &AudioPlayer::onPlaybackStateChanged);
}

void AudioPlayer::play(const QString &url)
{
    if (url.isEmpty()) {
        qWarning() << "AudioPlayer::play() - URL is empty";
        return;
    }
    
    // Stop current playback if any
    if (m_isPlaying) {
        stop();
    }
    
    // Set the media source
    QUrl mediaUrl;
    if (url.startsWith("qrc:") || url.startsWith("file:") || url.startsWith("http")) {
        mediaUrl = QUrl(url);
    } else {
        // Assume it's a local file path
        mediaUrl = QUrl::fromLocalFile(url);
    }
    
    m_player->setSource(mediaUrl);
    m_currentTrack = url;
    emit currentTrackChanged();
    
    // Start playing
    m_player->play();
    
    qDebug() << "AudioPlayer::play() - Playing:" << mediaUrl.toString();
}

void AudioPlayer::stop()
{
    if (m_player) {
        m_player->stop();
        m_currentTrack = "";
        emit currentTrackChanged();
    }
}

QVariantList AudioPlayer::getMusicList()
{
    // debug
    QString musicDir = QCoreApplication::applicationDirPath() + "/../../resources/Music";
    // publish
    // QString appDir = QCoreApplication::applicationDirPath();
    // QString musicDir = appDir + "/resources/Music";

    QDir dir(musicDir);
    QStringList filters;
    filters << "*.mp3" << "*.wav" << "*.flac";

    const QFileInfoList list = dir.entryInfoList(filters, QDir::Files);
    QVariantList musicList;
    // convert to QML urls
    for (const QFileInfo &info : list) {
        QVariantMap musicInfo;
        musicInfo["name"] = info.fileName();
        musicInfo["path"] = "file:///" + info.absoluteFilePath();
        musicList << musicInfo;
    }
    return musicList;
}

void AudioPlayer::changeMusic(const QString &musicUrl)
{

}

// void AudioPlayer::pause()
// {
//     if (m_player && m_isPlaying) {
//         m_player->pause();
//     }
// }

// void AudioPlayer::resume()
// {
//     if (m_player && !m_isPlaying) {
//         m_player->play();
//     }
// }

// void AudioPlayer::setVolume(float volume)
// {
//     if (m_audioOutput) {
//         // Clamp volume between 0.0 and 1.0
//         volume = qBound(0.0f, volume, 1.0f);
//         m_audioOutput->setVolume(volume);
//     }
// }

bool AudioPlayer::isPlaying() const
{
    return m_isPlaying;
}

QString AudioPlayer::currentTrack() const
{
    return m_currentTrack;
}

void AudioPlayer::onMediaStatusChanged(QMediaPlayer::MediaStatus status)
{
    qDebug() << "AudioPlayer::onMediaStatusChanged() - Status:" << status;
    
    switch (status) {
    case QMediaPlayer::LoadedMedia:
        qDebug() << "Media loaded successfully";
        break;
    case QMediaPlayer::InvalidMedia:
        qWarning() << "Invalid media";
        break;
    case QMediaPlayer::EndOfMedia:
        qDebug() << "End of media reached";
        stop();
        break;
    default:
        break;
    }
}

void AudioPlayer::onPlaybackStateChanged(QMediaPlayer::PlaybackState state)
{
    bool wasPlaying = m_isPlaying;
    
    switch (state) {
    case QMediaPlayer::PlayingState:
        m_isPlaying = true;
        qDebug() << "Playback started";
        break;
    case QMediaPlayer::PausedState:
        m_isPlaying = false;
        qDebug() << "Playback paused";
        break;
    case QMediaPlayer::StoppedState:
        m_isPlaying = false;
        qDebug() << "Playback stopped";
        break;
    }
    
    if (wasPlaying != m_isPlaying) {
        emit isPlayingChanged();
    }
}
