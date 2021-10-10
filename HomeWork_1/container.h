
#ifndef HW___CONTAINER_H
#define HW___CONTAINER_H

#include "animals.h"

// Простейший контейнер на основе одномерного массива
struct container {
    enum {max_len = 10000}; // максимальная длина
    int len; // текущая длина
    animals cont[max_len];
};

// Инициализация контейнера
void Init(container &c);

// Очистка контейнера от элементов (освобождение памяти)
void Clear(container &c);

// Ввод содержимого контейнера из указанного потока
void In(container &c, std::ifstream &ifst);

// Случайный ввод содержимого контейнера
void InRnd(container &c, int size);

// Вывод содержимого контейнера в указанный поток
void Out(container &c, std::ofstream &ofst);

// Вычисление среднего фрифметического для всех элементов
double Division(container &c);

// Удаление элемента контейнера по индексу
void Delete(container &c, int num);

// Удаление элементов контейнера не удовлетворяющих условию
 void DeleteAll(container &c);

#endif //HW___CONTAINER_H
