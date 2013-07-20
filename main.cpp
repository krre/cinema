#include <QGuiApplication>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;
    view.setTitle("The Game");
    view.setSource(QUrl::fromLocalFile("qml/main.qml"));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    QObject::connect((QObject*)view.engine(), SIGNAL(quit()), &app, SLOT(quit()));
    view.show();
    return app.exec();
}

