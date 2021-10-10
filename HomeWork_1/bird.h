
#ifndef HW___BIRD_H
#define HW___BIRD_H

#include <fstream>

struct bird {
    char name[15];
    int weight;
    bool migratory;
};
// Ввод параметров птицы из файла
void In(bird &b, std::ifstream &ifst);

// Случайный ввод птиы треугольника
void InRnd(bird &b);

// Вывод параметров птицы в форматируемый поток
void Out(bird &b, std::ofstream &ofst);

// Вычисление общей функции
double Division(bird &f);

#endif //HW___BIRD_H
