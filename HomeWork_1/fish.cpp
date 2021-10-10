
#include "fish.h"

// Ввод параметров рыбы из потока
void In(fish &f, std::ifstream &ifst) {
    int habit;
    ifst >> f.name >> f.weight >> habit;
    switch (habit) {
        case 1:
            f.k=fish::RIVER;
            break;
        case 2:
            f.k=fish::LAKE;
            break;
        case 3:
            f.k=fish::OCEAN;
            break;
        case 4:
            f.k=fish::SEA;
            break;
    }
}

// Случайный ввод параметров рыбы
void InRnd(fish &f) {
    int name_length = rand() % 15 + 1;
    for (int i = 0; i < name_length; ++i) {
        f.name[i]=(rand()%(122-97))+97;
    }
    int habit = rand() % 4 + 1;
    switch(habit){
        case 1:
            f.k = fish::RIVER;
            break;
        case 2:
            f.k=fish::LAKE;
            break;
        case 3:
            f.k=fish::OCEAN;
            break;
        case 4:
            f.k=fish::SEA;
            break;
    }
    f.weight = rand() % 1000 + 1;
}

// Вывод параметров рыбы в поток
void Out(fish &f, std::ofstream &ofst) {
    ofst << "Fish: name = "
         << f.name << ", weight = " << f.weight
         << ", habit = ";
    switch (f.k) {
        case 0:
            ofst << "river";
            break;
        case 1:
            ofst << "lake";
            break;
        case 2:
            ofst << "ocean";
            break;
        case 3:
            ofst << "sea";
            break;

    }
    ofst << ". Division result = " << Division(f) << "\n";
}

// Вычисление общей функции
double Division(fish &f) {
    double sum = 0.0;
    int i = 0;
    while((f.name[i]>= 97)&&(f.name[i]<=122)){
        sum += f.name[i++];
    }
    return sum/f.weight;
}
