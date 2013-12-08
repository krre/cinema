#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/Cinema/main.qml"));

#ifdef Q_OS_WIN32
    viewer.showExpanded();
#else
    viewer.showFullScreen();
#endif

    return app.exec();
}
