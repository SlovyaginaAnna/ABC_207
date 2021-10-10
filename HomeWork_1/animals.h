
#ifndef HW___ANIMALS_H
#define HW___ANIMALS_H
#include "fish.h"
#include "bird.h"
#include "beast.h"

// структура, обобщающая все виды животных
struct animals {
    enum key {FISH, BIRD, BEAST};
    key k;
    union {
        fish f;
        bird b;
        beast be;
    };
};

// Ввод обобщенного вида животного
bool In(animals &an, std::ifstream &ifdt);

// Случайный ввод обобщенного вида животного
bool InRnd(animals &an);

// Вывод обобщенного вида животного
void Out(animals &an, std::ofstream &ofst);

// Вычисление общей функции
double Division(animals &s);

#endif //HW___ANIMALS_H
