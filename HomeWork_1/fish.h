
#ifndef HW___FISH_H
#define HW___FISH_H
#include <fstream>

//------------------------------------------------------------------------------
// Рыба
struct fish {
    char name[15];
    int weight;
    enum keyF {RIVER, LAKE, OCEAN, SEA};
    enum keyF k;
};
// Ввод параметров рыбы из файла
void In(fish &f, std::ifstream &ifst);

// Случайный ввод параметров рыбы
void InRnd(fish &f);

// Вывод параметров рыбы в форматируемый поток
void Out(fish &f, std::ofstream &ofst);

// Вычисление общей функции
double Division(fish &t);

#endif //HW___FISH_H
