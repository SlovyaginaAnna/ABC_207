#include "beast.h"
#include <cstdlib>

// Ввод зверя из файла
void Beast::In(ifstream &ifst) {
    ifst >> name >> weight;
    int typ;
    ifst >> typ;
    switch(typ) {
        case 1 :
            t=HERBIVOROUS;
            break;
        case 2:
            t=PREDATOR;
            break;
        case 3:
            t=INSECTIVOROUS;
            break;
        default:
            t = HERBIVOROUS;
            break;
    }
}

// Случайный ввод зверя
void Beast::InRnd() {
    int name_length = rand() % 15 + 1;
    char symbol;
    for (int i = 0; i < name_length; ++i) {
        symbol = rand() % 25 + 98;
        name += symbol;
    }
    weight = rand() % 1000 + 1;
    int typ = rand() % 3 + 1;

    switch(typ) {
        case 1 :
            t=HERBIVOROUS;
            break;
        case 2:
            t=PREDATOR;
            break;
        case 3:
            t=INSECTIVOROUS;
            break;
    }
}

// Запись в файл
void Beast::Out(ofstream &ofst) {
    ofst << "It is Beast: name = " << name << ", weight = " << weight
         << ", habit = ";
    switch(t){
        case HERBIVOROUS:
            ofst << "HERBIVOROUS";
            break;
        case PREDATOR:
            ofst << "PREDATOR";
            break;
        case INSECTIVOROUS:
            ofst << "INSECTIVOROUS";
            break;
    }
    ofst    << ". Division = " << Division() << "\n";
}

// Функция деления суммы символов имени на вес
double Beast::Division() {
    double sum = 0.0;
    for (int i = 0; i < name.length(); ++i) {
        sum += name[i];
    }
    return sum/weight;
}