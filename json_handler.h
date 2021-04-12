#ifndef JSON_HANDLER_H
#define JSON_HANDLER_H

#include <QObject>

class JSON_HANDLER : public QObject
{
Q_OBJECT
public:
explicit JSON_HANDLER(QObject *parent = 0);

Q_INVOKABLE void writeJson(QString txt, QString out);
Q_INVOKABLE QString readJson(QString fileName);
Q_INVOKABLE void writeListModel(QString fileName, QString out);
signals:

public slots:

};

#endif // HELLOCPP_H
