#ifndef HOMEWORK_2_BEAST_H
#define HOMEWORK_2_BEAST_H

#include <fstream>
#include "animals.h"
using namespace std;

// Тип животного
enum type {
    HERBIVOROUS,
    PREDATOR,
    INSECTIVOROUS
};

// Зверь
class Beast: public Animals {
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
    type t;
};
#endif //HOMEWORK_2_BEAST_H
