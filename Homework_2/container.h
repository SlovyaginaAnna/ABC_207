#ifndef HOMEWORK_2_CONTAINER_H
#define HOMEWORK_2_CONTAINER_H
#include "animals.h"
#include "fstream"

// Контейнер
class Container {
public:
    // Конструктор
    Container();
    // Ввод из файла
    void In(std::ifstream &ifst);
    // Рандомный ввод
    void InRnd(int size);
    // Вывод в файл
    void Out(std::ofstream &ofst);
    // Подсчет значения функции
    double Division();
    // Удаление элементов из контейнера не подходящих по условию
    void DeleteAll();
    // Удаление элемента из контейнера по индексу
    void Delete(int index);
    // Удаление контейнера
    void Clear();
private:
    // Длина контейнера
    int len;
    // Контейнер животных
    Animals* storage[10000];
};
#endif
