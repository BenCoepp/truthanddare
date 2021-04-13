#ifndef TAD_SELECTOR_H
#define TAD_SELECTOR_H

#include <QObject>

class TAD_Selector:public QObject{
    Q_OBJECT
public:
    explicit TAD_Selector(QObject * parent = 0);
    Q_INVOKABLE void selector(QString input);
    Q_INVOKABLE QString selectorString(QString input);
    Q_IMPLICIT void jsonRead(QString jsonString);
signals:
public slots:

};

#endif // TAD_SELECTOR_H
