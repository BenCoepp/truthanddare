#ifndef FIREBASE_DB_H
#define FIREBASE_DB_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>

class Firebase : public QObject
{
Q_OBJECT
public:
    explicit Firebase(QObject *parent = 0);

    Q_INVOKABLE QString get(const QString & url);
    Q_INVOKABLE void put(const QString & url, QJsonDocument & payload);
    Q_INVOKABLE void post(const QString & url, QJsonDocument & payload);

    //Firebase
    Q_INVOKABLE void setAPIKey(const QString & apiKey);
    Q_INVOKABLE void signUserUp(const QString & email, const QString & password);
    Q_INVOKABLE void signUserIn(const QString & email, const QString & password);
public slots:
    void networkReplayReadyRead();
private:
    QString firebase_realtimeDatabase_URL = "https://truthanddare-bencoepp-default-rtdb.europe-west1.firebasedatabase.app/";
    QString firebase_firestore_URL = "https://firestore.googleapis.com/v1/";
    QString firebase_apiKey = "";
    QString m_apiKey;
    QNetworkAccessManager * m_networkAccessManager;
    QNetworkReply * m_networkReply;
};

#endif // FIREBASE_DB_H
