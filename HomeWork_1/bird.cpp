
#include "bird.h"

// Ввод параметров птицы из потока
void In(bird &b, std::ifstream &ifst) {
    int migratory;
    ifst >> b.name >> b.weight >> migratory;
    switch (migratory) {
        case 0:
            b.migratory=false;
            break;
        case 1:
            b.migratory=true;
            break;
    }
}

// Случайный ввод параметров птицы
void InRnd(bird &b) {
    int name_length = rand() % 15 + 1;
    for (int i = 0; i < name_length; ++i) {
        b.name[i]=(rand()%(122-97))+97;
    }
    int migratory = rand() % 2 + 1;
    switch(migratory){
        case 1:
            b.migratory=false;
            break;
        case 2:
            b.migratory=true;
            break;
    }
    b.weight = rand() % 1000 + 1;
}

// Вывод параметров птицы в поток
void Out(bird &b, std::ofstream &ofst) {
    ofst << "Bird: name = "
         << b.name << ", weight = " << b.weight
         << ", migratory = " << b.migratory
         << ". Division result = " << Division(b) << "\n";
}

// Вычисление общей функции
double Division(bird &b) {
    double sum = 0.0;
    int i = 0;
    while((b.name[i]>= 97)&&(b.name[i]<=122)){
        sum += b.name[i++];
    }
    return sum/b.weight;
}
