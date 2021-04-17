#ifndef FIREBASE_DB_H
#define FIREBASE_DB_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>

class Firebase_DB : public QObject
{
Q_OBJECT
public:
    explicit Firebase_DB(QObject *parent = 0);

    Q_INVOKABLE QString dbget(QString txt);
    Q_INVOKABLE void dbput(QString fileName);
    Q_INVOKABLE void dbpost(const QString & url, QJsonDocument & payload);

    Q_INVOKABLE void dbsetAPIKey(const QString & apiKey);
    Q_INVOKABLE void dbsignUserUp(const QString & email, const QString & password);
    Q_INVOKABLE void dbsignUserIn(const QString & email, const QString & password);
public slots:
    void networkReplayReadyRead();
private:
    QString firebaseBase_URL = "";
    QString m_apiKey;
    QNetworkAccessManager * m_networkAccessManager;
    QNetworkReply * m_networkReply;
};

#endif // FIREBASE_DB_H
