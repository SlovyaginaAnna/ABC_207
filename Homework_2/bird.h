#ifndef HOMEWORK_2_BIRD_H
#define HOMEWORK_2_BIRD_H
#include <fstream>
#include "animals.h"
using namespace std;

// Птица
class Bird: public Animals {
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
    // Переменная отвечающая является ли птица перелетной
    bool migratory;
};
#endif
