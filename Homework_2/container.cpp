#include <iostream>
#include "container.h"
#include "fstream"

// Конструктор контейнера
Container::Container(): len{0} { }

// Очищение массива животных
void Container::Clear() {
    for(int i = 0; i < len; i++) {
        delete storage[i];
    }
    len = 0;
}

// Ввод из файла
void Container::In(ifstream &ifst) {
    while(!ifst.eof()) {
        if((storage[len] = Animals::StaticIn(ifst)) != nullptr) {
            ++len;
        }
    }
    --len;
}

// Рандомный ввод
void Container::InRnd(int size) {
    while(len < size) {
        if((storage[len] = Animals::StaticInRnd()) != nullptr) {
            ++len;
        }
    }
}

// Вывод в файл
void Container::Out(ofstream &ofst) {
    ofst << "Container contains " << len << " elements.\n";
    for(int i = 0; i < len; i++) {
        ofst << i << ": ";
        storage[i]->Out(ofst);
    }
}

// Вычисление функции
double Container::Division() {
    double sum = 0.0;
    for(int i = 0; i < len; i++) {
        sum += storage[i]->Division();
    }
    return sum/len;
}

// Удаление элемента из контейнера по индексу
void Container::Delete(int num){
    Animals* an = storage[num];
    // Сдвигаем элементы массива
    for (int i = num + 1; i < len; ++i) {
        storage[i - 1] = storage[i];
    }
    --len;
    // Удаляем нужный элемент
    delete an;
}

// Удаление ненужных элементов из контейнера
void Container::DeleteAll() {
    int count =0;
    while(count < len) {
        // Проверяем что значение общей элемента функции меньше среднего арифметического
        if (Division() > storage[count]->Division()) {
            // Удаляем элемент
            Delete(count);
        } else {
            ++count;
        }
    }
}
