#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "json_handler.h"
#include "firebase_db.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<JSON_HANDLER>("JSON_HANDLER", 1, 0, "JSON_HANDLER");
    qmlRegisterType<Firebase_DB>("Firebase", 1, 0, "Firebase");
    const QUrl url(QStringLiteral("qrc:/main/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
