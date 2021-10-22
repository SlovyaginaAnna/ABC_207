#ifndef HOMEWORK_2_ANIMALS_H
#define HOMEWORK_2_ANIMALS_H

#include <fstream>
using namespace std;

// Животное
class Animals {
public:
    // Ввод животного из файла
    static Animals *StaticIn(ifstream &ifdt);
    // Виртуальный метод для ввода подвида животного из файла
    virtual void In(ifstream &ifdt) = 0;
    // Рандомный ввод
    static Animals *StaticInRnd();
    // Виртуальный метод рандомного ввода
    virtual void InRnd() = 0;
    // Вывод в файл
    virtual void Out(ofstream &ofst) = 0;
    // Подсчет функции деления суммы символов имени на вес
    virtual double Division() = 0;
protected:
    string name;
protected:
    int weight;
};
#endif
