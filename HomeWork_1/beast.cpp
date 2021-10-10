
#include "beast.h"

// Ввод параметров зверя из потока
void In(beast &be, std::ifstream &ifst) {
    int type;
    ifst >> be.name >> be.weight >> type;
    switch (type) {
        case 1:
            be.k = beast::HERBIVOROUS;
            break;
        case 2:
            be.k = beast::PREDATOR;
            break;
        case 3:
            be.k = beast::INSECTIVOROUS;
            break;
    }
}

// Случайный ввод параметров зверя
void InRnd(beast &be) {
    int name_length = rand() % 15 + 1;
    for (int i = 0; i < name_length; ++i) {
        be.name[i]=(rand()%(122-97))+97;
    }
    int type = rand() % 3 + 1;
    switch(type){
        case 1:
            be.k = beast::HERBIVOROUS;
            break;
        case 2:
            be.k = beast::PREDATOR;
            break;
        case 3:
            be.k = beast::INSECTIVOROUS;
            break;
    }
    be.weight = rand() % 10000 + 1;
}

// Вывод параметров зверя в поток
void Out(beast &be, std::ofstream &ofst) {
    ofst << "Beast: name = "
         << be.name << ", weight = " << be.weight
         << ", type = ";
    switch (be.k) {
        case 0:
            ofst << "herbivorous";
            break;
        case 1:
            ofst << "predator";
            break;
        case 2:
            ofst << "insectivorous";
            break;
    }
    ofst  << ". Division result = " << Division(be) << "\n";
}

// Вычисление общей функции
double Division(beast &be) {
    double sum = 0.0;
    int i = 0;
    while((be.name[i]>= 97)&&(be.name[i]<=122)){
        sum += be.name[i++];
    }
    return sum/be.weight;
}
