#include "fish.h"
#include <cstdlib>
#include <iostream>

// Ввод рыбы из файла
void Fish::In(ifstream &ifst) {
    ifst >> name >> weight;
    int hab;
    ifst >> hab;
    switch(hab) {
        case 1 :
            h=RIVER;
            break;
        case 2:
            h=LAKE;
            break;
        case 3:
            h=OCEAN;
            break;
        case 4:
            h=SEA;
            break;
        default:
            h = RIVER;
            break;
    }
}

// Случайный ввод рыбы
void Fish::InRnd() {
    int name_length = rand() % 15 + 1;
    char symbol;
    for (int i = 0; i < name_length; ++i) {
        symbol = rand() % 25 + 98;
        name += symbol;
    }
    weight = rand() % 1000 + 1;
    int hab = rand() % 4 + 1;

    switch(hab) {
        case 1 :
            h=RIVER;
            break;
        case 2:
            h=LAKE;
            break;
        case 3:
            h=OCEAN;
            break;
        case 4:
            h=SEA;
            break;
    }
}

// Запись в файл
void Fish::Out(ofstream &ofst) {
    ofst << "It is Fish: name = " << name << ", weight = " << weight
         << ", habit = ";
    switch(h){
        case RIVER:
            ofst << "RIVER";
            break;
        case LAKE:
            ofst << "LAKE";
            break;
        case OCEAN:
            ofst << "OCEAN";
            break;
        case SEA:
            ofst << "SEA";
            break;
    }
    ofst << ". Division = " << Division() << "\n";
}

// Функция деления суммы символов имени на вес
double Fish::Division() {
    double sum = 0.0;
    for (int i = 0; i < name.length(); ++i) {
        sum += name[i];
    }
    return sum/weight;
}