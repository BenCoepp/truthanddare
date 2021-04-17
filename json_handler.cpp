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
using namespace std;

JSON_HANDLER::JSON_HANDLER(QObject *parent) :
QObject(parent)
{
}

void JSON_HANDLER::writeJson(QString file, QString out)
{
    // Create and open a text file
      ofstream MyFile(file.toStdString() + ".json");
      if(MyFile.is_open()){
          qDebug() << "File Opend Correctly";
      }else{
          qDebug() << "File Opend not Correctly";
      }

      // Write to the file
      MyFile << out.toStdString();
      MyFile.close();
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

