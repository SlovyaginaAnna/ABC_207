#ifndef HOMEWORK_2_FISH_H
#define HOMEWORK_2_FISH_H
#include <fstream>
#include "animals.h"
using namespace std;

// Место обитания рыбы
enum habit{
    RIVER,
    LAKE,
    OCEAN,
    SEA
};

// Рыба
class Fish: public Animals {
public:
    // Ввод параметров из файла
    virtual void In(ifstream &ifst);
    // Случайный ввод параметров
    virtual void InRnd();
    // Вывод параметров в файл
    virtual void Out(ofstream &ofst);
    // Подсчет функции
    virtual double Division();
private:
    habit h;
};
#endif
