#include "bird.h"
#include <cstdlib>
#include <iostream>

// Ввод птицы из файла
void Bird::In(ifstream &ifst) {
    ifst >> name >> weight;
    int migr;
    ifst >> migr;
    if (migr == 0) {
        migratory = false;
    } else {
        migratory = true;
    }
}

// Случайный ввод птицы
void Bird::InRnd() {
    int name_length = rand() % 15 + 1;
    char symbol;
    for (int i = 0; i < name_length; ++i) {
        symbol = rand() % 25 + 98;
        name += symbol;
    }
    weight = rand() % 1000 + 1;
    migratory = rand() % 2;
}

// Запись в файл
void Bird::Out(ofstream &ofst) {
    ofst << "It is Bird: name = " << name << ", weight = " << weight
         << ", migratory = " << migratory
         << ". Division = " << Division() << "\n";
}

// Функция деления суммы символов имени на вес
double Bird::Division() {
    double sum = 0.0;
    for (int i = 0; i < name.length(); ++i) {
        sum += name[i];
    }
    return sum/weight;
}