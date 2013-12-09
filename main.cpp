#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setSource(QUrl("qrc:/qml/main.qml"));

#ifdef Q_OS_ANDROID
    viewer.showFullScreen();
#else
    viewer.showExpanded();
#endif

    return app.exec();
}
