#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <qml/config.h>
#include "qml/AudioPlayer.h"

// #include "qml/Pay.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    AudioPlayer audioPlayer;
    Config config;

    engine.rootContext()->setContextProperty("audioPlayer", &audioPlayer);
    engine.rootContext()->setContextProperty("userConfig", &config);

    const QUrl url(QStringLiteral("qrc:/useless/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
