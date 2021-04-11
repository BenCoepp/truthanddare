#ifndef JSON_H
#define JSON_H

#include <QObject>

class JSON : public QObject
{
Q_OBJECT
public:
explicit JSON(QObject *parent = 0);

Q_INVOKABLE void writeJson(QString txt, QString out);
Q_INVOKABLE QString readJson(QString fileName);
signals:

public slots:

};

#endif // HELLOCPP_H
