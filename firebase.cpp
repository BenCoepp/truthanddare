#include "firebase.h"
#include <QDebug>
#include <QVariantMap>
#include <QNetworkRequest>
Firebase::Firebase(QObject *parent)
    : QObject(parent)
    , m_apiKey(QString() )
{
    m_networkAccessManager = new QNetworkAccessManager(this);
}
//User LogIn and SignUp
void Firebase::signUserUp(const QString &email, const QString &password){
    QString signUpEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + m_apiKey;
    QVariantMap variantPayload;
    variantPayload["email"] = email;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPlayload = QJsonDocument::fromVariant(variantPayload);
    post(signUpEndpoint, jsonPlayload);
}
void Firebase::signUserIn(const QString &email, const QString &password){
    QString signInEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + m_apiKey;
    QVariantMap variantPayload;
    variantPayload["email"] = email;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPlayload = QJsonDocument::fromVariant(variantPayload);
    post(signInEndpoint, jsonPlayload);
}

//Post, Get and Put Functions
void Firebase::post(const QString &url, QJsonDocument &payload){
    QNetworkRequest newRequest((QUrl(url)));
    newRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkReply = m_networkAccessManager->post(newRequest, payload.toJson());

    connect(m_networkReply, &QNetworkReply::readyRead, this, &Firebase::networkReplayReadyRead);
}
QString Firebase::get(const QString &url){
    QNetworkRequest newRequest((QUrl(firebase_realtimeDatabase_URL + url)));
    m_networkReply = m_networkAccessManager->get(newRequest);
    return m_networkReply->readAll();
}
void Firebase::put(const QString &url, QJsonDocument &payload)
{

}

//set Firebase Values
void Firebase::setAPIKey(const QString &apiKey){
    m_apiKey = apiKey;
}

void Firebase::networkReplayReadyRead(){
    qDebug() << m_networkReply->readAll();
}
