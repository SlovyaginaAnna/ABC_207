
#include "animals.h"

// структура, обобщающая все виды животных
bool In(animals& an, std::ifstream &ifst) {
    int k;
    ifst >> k;
    switch(k) {
        case 1:
            an.k = animals::FISH;
            In(an.f, ifst);
            return true;
        case 2:
            an.k = animals::BIRD;
            In(an.b, ifst);
            return true;
        case 3:
            an.k = animals::BEAST;
            In(an.be, ifst);
            return true;
        default:
            return false;
    }
}

// Случайный ввод обобщенного вида животного
bool InRnd(animals& an) {
    auto k = rand() % 3 + 1;
    switch(k) {
        case 1:
            an.k = animals::FISH;
            InRnd(an.f);
            return true;
        case 2:
            an.k = animals::BIRD;
            InRnd(an.b);
            return true;
        case 3:
            an.k = animals::BEAST;
            InRnd(an.be);
            return true;
        default:
            return false;
    }
}

// Вывод параметров вида животного
void Out(animals& an, std::ofstream &ofst) {
    switch(an.k) {
        case 0:
            an.k = animals::FISH;
            Out(an.f, ofst);
            break;
        case 1:
            an.k = animals::BIRD;
            Out(an.b, ofst);
            break;
        case 2:
            an.k = animals::BEAST;
            Out(an.be, ofst);
            break;
        default:
            ofst << "Incorrect figure!\n";
    }
}

// Вычисление общей функции
double Division(animals& an) {
    switch(an.k) {
        case animals::FISH:
            return Division(an.f);
            break;
        case animals::BIRD:
            return Division(an.b);
            break;
        case animals::BEAST:
            return Division(an.be);
            break;
        default:
            return 0.0;
    }
}
