
#ifndef HW___BEAST_H
#define HW___BEAST_H
#include <fstream>

struct beast {
    char name[15];
    int weight;
    enum type{HERBIVOROUS, PREDATOR, INSECTIVOROUS};
    enum type k;
};

// Ввод параметров зверя из файла
void In(beast &be, std::ifstream &ifst);

// Случайный ввод параметров зверя
void InRnd(beast &b);

// Вывод параметров зверя в форматируемый поток
void Out(beast &b, std::ofstream &ofst);

// Вычисление общей функции
double Division(beast &f);

#endif //HW___BEAST_H
