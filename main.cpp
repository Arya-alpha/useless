#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "qml/Pay.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Pay pay;
    engine.rootContext()->setContextProperty("pay", &pay);

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
