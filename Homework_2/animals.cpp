#include <iostream>
#include "animals.h"
#include "fish.h"
#include "bird.h"
#include "beast.h"

// Статический метод ввода животного из файла
Animals* Animals::StaticIn(ifstream &ifst) {
    int k;
    ifst >> k;
    Animals* an = nullptr;
    switch(k) {
        case 1:
            an = new Fish;
            break;
        case 2:
            an = new Bird;
            break;
        case 3:
            an = new Beast;
            break;
        default:
            string name;
            ifst >> name  >> k >> k;
            return an;
    }
    an->In(ifst);
    return an;
}

// Статический метод рандомного ввода
Animals *Animals::StaticInRnd() {
    auto k = rand() % 3 + 1;
    Animals* an = nullptr;
    switch(k) {
        case 1:
            an = new Fish;
            break;
        case 2:
            an = new Bird;
            break;
        case 3:
            an = new Beast;
            break;
    }
    an->InRnd();
    return an;
}