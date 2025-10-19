#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationDisplayName("FSGC");
    QCoreApplication::setOrganizationName("boosalis");
    QCoreApplication::setApplicationVersion("1.0");
    QQmlApplicationEngine engine;

    engine.addImportPath("qrc:/qml");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));

    return app.exec();
}
