#include "useless.h"

#include <QApplication>
#include <QLabel>
#include <QPixmap>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    UseLess w;
    w.show();
    return a.exec();
}
