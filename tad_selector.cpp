#include "tad_selector.h"
#include <iostream>
#include <fstream>
#include <QFile>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonParseError>
#include <QJsonValue>
#include <QAbstractListModel>
#include <QDebug>

using namespace std;
TAD_Selector::TAD_Selector(QObject * parent):
    QObject(parent)
{

}

void TAD_Selector::selector(QString input){
    qDebug()<<input;
}

QString TAD_Selector::selectorString(QString input){
    return input + " changed";
}

void TAD_Selector::jsonRead(QString jsonString){
    jsonString = "";
}
