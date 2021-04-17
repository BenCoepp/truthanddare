#include "firebase_db.h"
#include <QDebug>
#include <QVariantMap>
#include <QNetworkRequest>
Firebase_DB::Firebase_DB(QObject *parent)
    : QObject(parent)
    , m_apiKey(QString() )
{
    m_networkAccessManager = new QNetworkAccessManager(this);
}

void Firebase_DB::dbsignUserUp(const QString &email, const QString &password){
    QString signUpEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + m_apiKey;
    QVariantMap variantPayload;
    variantPayload["email"] = email;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPlayload = QJsonDocument::fromVariant(variantPayload);
    dbpost(signUpEndpoint, jsonPlayload);
}
void Firebase_DB::dbsignUserIn(const QString &email, const QString &password){
    QString signInEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + m_apiKey;
    QVariantMap variantPayload;
    variantPayload["email"] = email;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPlayload = QJsonDocument::fromVariant(variantPayload);
    dbpost(signInEndpoint, jsonPlayload);
}

void Firebase_DB::dbpost(const QString &url, QJsonDocument &payload){
    QNetworkRequest newRequest((QUrl(url)));
    newRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkReply = m_networkAccessManager->post(newRequest, payload.toJson());

    connect(m_networkReply, &QNetworkReply::readyRead, this, &Firebase_DB::networkReplayReadyRead);
}
QString Firebase_DB::dbget(QString txt){
    return txt;
}
void Firebase_DB::dbput(QString fileName){
    qDebug()<< fileName;
}
void Firebase_DB::dbsetAPIKey(const QString &apiKey){
    m_apiKey = apiKey;
}

void Firebase_DB::networkReplayReadyRead(){
    qDebug() << m_networkReply->readAll();
}
