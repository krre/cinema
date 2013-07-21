#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setTitle("The Game");
    viewer.setMainQmlFile(QStringLiteral("qml/main.qml"));
    QObject::connect((QObject*)viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));
    viewer.showExpanded();

    return app.exec();
}
