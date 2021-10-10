#include "container.h"

// Инициализация контейнера
void Init(container &c) {
    c.len = 0;
}

// Очистка контейнера от элементов
void Clear(container &c) {
    c.len = 0;
}

// Ввод содержимого контейнера из указанного потока
void In(container &c, std::ifstream &ifst) {
    while(!ifst.eof()) {
        if(In(c.cont[c.len], ifst)) {
            c.len++;
        }
    }
    c.len--;
}

// Случайный ввод содержимого контейнера
void InRnd(container &c, int size) {
    while(c.len < size) {
        if(InRnd(c.cont[c.len])) {
            c.len++;
        }
    }
}

// Вывод содержимого контейнера в указанный поток
void Out(container &c, std::ofstream &ofst) {
    ofst << "Container contains " << c.len << " elements.\n";
    for(int i = 0; i < c.len; i++) {
        ofst << i << ": ";
        Out(c.cont[i], ofst);
    }
}

// Вычисление среднего фрифметического для всех элементов
double Division(container &c) {
    double sum = 0.0;
    int count;
    for(int i = 0; i < c.len; i++) {
        sum += Division(c.cont[i]);
        count = i;
    }
    return sum/++count;
}

// Удаление элемента контейнера
void Delete(container &c, int num){
    for (int i = num + 1; i < c.len; ++i) {
        c.cont[i - 1] = c.cont[i];
    }
    c.len--;
}

// Удаление элементов контейнера не удовлетворяющих условию
void DeleteAll(container &c) {
    int count =0;
    while(count < c.len) {
        // Проверяем что значение общей элемента функции меньше среднего арифметического
        if (Division(c.cont[count]) < Division(c)) {
            // Удаляем элемент
            Delete(c, count);
        } else {
            ++count;
        }
    }
}
