#include "json_handler.h"
#include <QDebug>
#include <iostream>
#include <fstream>
#include <QFile>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonParseError>
#include <QJsonValue>
#include <QAbstractListModel>
#include <QNetworkRequest>

using namespace std;

JSON_HANDLER::JSON_HANDLER(QObject *parent) :
QObject(parent)
{
    m_networkManager = new QNetworkAccessManager(this);
    m_networkReply = m_networkManager->get(QNetworkRequest(QUrl("https://truthanddare-bencoepp-default-rtdb.europe-west1.firebasedatabase.app/.json")));

    connect(m_networkReply,&QNetworkReply::readyRead, this, &JSON_HANDLER::downloadTadData);
}

void JSON_HANDLER::writeJson(QString file, QString out)
{
      // Create and open a text file
      ofstream MyFile(file.toStdString() + ".json");

      // Write to the file
      MyFile << out.toStdString();

      // Close the files
      MyFile.close();
}

void JSON_HANDLER::downloadTadData()
{
    writeJson("TAD_Data", m_networkReply->readAll());
}

QString JSON_HANDLER::readJson(QString fileName){
    QString val;
    QFile file;

    file.setFileName(fileName+".json");
    file.open(QIODevice::ReadOnly | QIODevice::Text);

    val = file.readAll();
    file.close();

    return val;
}

void JSON_HANDLER::writeListModel(QString fileName, QString out)
{
    ofstream MyFile(fileName.toStdString() + ".json");
    MyFile << out.toStdString();
    MyFile.close();
}
