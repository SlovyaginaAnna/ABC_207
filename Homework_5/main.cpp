#include <iostream>
#include <fstream>
#include <cstring>
#include <thread>
#include <semaphore>
#include <mutex>

// Сообщение, информирующее о некорректном вводе числа аргументов командной строки
void errMessage1() {
    std::cout << "incorrect command line!\n"
                 "  Waited:\n"
                 "     command -f infile outfile\n"
                 "  Or:\n"
                 "     command -n number outfile\n";
}

// Сообщение, информирующее о некорректном вводе аргументов командной строки
void errMessage2() {
    std::cout << "incorrect qualifier value!\n"
                 "  Waited:\n"
                 "     command -f infile outfile\n"
                 "  Or:\n"
                 "     command -n number outfile\n";
}

// Структура приглашения
struct Invitation{
    int number; // Номер приглашения
    std::string name; // Имя поклонника
    std::string text; // Текст приглашения
    bool response; // Ответ студентки
};

std::mutex mutex; // Мьютекс для синхронизации потока
int size; // Количество поклонников
Invitation* invitations; // Массив приглашений
std::ifstream ifst; // Поток для вывода из файла
std::ofstream  ofst; // Поток для ввода из файла
bool fileInput; // Переменная отражающая происходит ввод из файла или рандомно
int indexOfArray; // Индекс массива, который отправляет клиент серверу
std::counting_semaphore<1> signalFirst(0); // Семафор для того, чтобы сервер ожидал сообщение от клиента
std::counting_semaphore<1> signalSecond(0); // Семафор для того, чтобы клиент ожидал ответ от сервера

// Рандомный ввод приглашения
void randInp(int index) {
    invitations[index].number = index + 1; // Номер приглашения равен номеру массива плюс 1
    int nameLength = rand() % 3 + 3; // Генерация дляны имени
    // Генерация имени
    for (int j = 0; j < nameLength; ++j) {
        invitations[index].name += rand() % 25 + 97;
    }
    invitations[index].name[0] -= 32; // Делаем первую букву имени заглавной
    int textLength = rand() % 40 + 2; // Генерация дляны приглашения
    // Генерация приглашения
    for (int j = 0; j < textLength; ++j) {
        invitations[index].text += rand() % 25 + 97;
    }
}

// Ввод из файла
void fileInp(int index) {
    invitations[index].number = index + 1; // Записываем номер приглашения
    ifst >> invitations[index].name; // Считываем имя поклонника
    ifst >> invitations[index].text; // Считываем текст приглашения
}

// Вывод сообщения на экран
void print(int number, int index) {
    // Вывод общей части сообщения для всех случаев
    std::cout << "Invitation number " << invitations[index].number << " from " << invitations[index].name
              << " with text - " << invitations[index].text << " was ";
    switch(number) {
        case 1: // Вывод о том, что приглашение прочитано
            std::cout << "read\n";
            break;
        case 2: // Вывод о том, что приглашение сгенерировано
            std::cout << "generated\n";
            break;
        case 3: // Вывод о том, что сообщение отправлено серверу
            std::cout << "sent\n";
            break;
        case 4: // Вывод о том, что приглашение одобрено
            std::cout << " approved\n";
            break;
        case 5: // Вывод о том, что приглашение не одобрено
            std::cout << " denied\n";
            break;
        case 6: // Вывод клиентом как в консоль так и в файл ответ на приглашение
            std::string answer = invitations[index].response ? "positively" : "negatively";
            std::cout << "answered " << answer << "\n";
            ofst << "Invitation number " << invitations[index].number << " from " << invitations[index].name
                 << " with text - " << invitations[index].text << " was answered " << answer << "\n";
            break;
    }
}

// Функция имитирующая работу сервера
void funcServer() {
    bool agreed = false; // Переменная отражающая, было ли выбрано приглашение
    int count = 0; // Число уже просмотренных приглашений
    while(count < size) { // Цикл работающий до того, пока все приглашения не будут просмотрены
        signalFirst.acquire(); // Ожидание сообщения клиентов
        // Проверка, что приглашение соответствует требованиям
        if (!agreed && invitations[indexOfArray].text.length() > 20 && invitations[indexOfArray].text.length() < 30) {
            invitations[indexOfArray].response = true; // Записываем положительный ответ на приглашение
            agreed = true; // Записываем что приглашение выбрано
            print(4, indexOfArray); // Выводим сообщение об этом
        } else if (!agreed && (count + 1) == size) { // Если приглашение не было выбрано и это последнее приглашение, то даем положительный ответ
            invitations[indexOfArray].response = true; // Записываем положительный ответ на приглашение
            agreed = true; // Записываем что приглашение выбрано
            print(4, indexOfArray); // Выводим сообщение об этом
        } else { // Даем отрицательный ответ на приглашение
            invitations[indexOfArray].response = false; // Записываем отприцательный ответ
            print(5, indexOfArray); // Выводим сообщение
        }
        indexOfArray = -1; // Меняем индекс на первоначальный
        count++; // Увеличиваем счетчик просмотренных приглашений
        signalSecond.release(); // Отправляем сигнал клиенту
    }
}

// Функция имитирующая работу клиентов
void func(int param) {
    if (fileInput) { // Проверяем что ввод происходит из файла
        mutex.lock(); // Ставим блокировку для остальных потоков
        fileInp(param); // Вызываем функцию ввода из файла
        print(1, param); // Выводим сообщения
        mutex.unlock(); // Убираем блокировку
    } else {
        randInp(param); // Вводим рандомные приглашения
        mutex.lock(); // Ставим блокировку
        print(2, param); // Выводим сообщения на экран
        mutex.unlock(); // Убираем блокировку
    }
    mutex.lock(); // Ставим блокировку
    indexOfArray = param; // Записываем индекс для отправки на сервер
    print(3, param);
    signalFirst.release(); // Отпраляем сигнал серверу
    signalSecond.acquire(); // Ждем пока запрос обработается
    print(6, param);
    mutex.unlock(); // Снимаем блокировку
}

int main(int argc, char* argv[]) {
    // Вывод сообщение при неправильном количестве аргументов в командной строке
    if(argc != 4) {
        errMessage1();
        return 1;
    }

    // Проверяем выводить приглашения из файла или рандомно их заполнять
    if(!strcmp(argv[1], "-f")) {
        ifst = std::ifstream (argv[2]);
        // Считываем количество приглашений из файла
        ifst >> size;
        // Инициализируем массив с приглашениями
        invitations = new Invitation[size];
        fileInput = true;
    }
    else if(!strcmp(argv[1], "-n")) {
        // Считываем количество приглашений из командной строки
        size = atoi(argv[2]);
        // Проверяем, что число пориглашений корректно
        if((size < 1) || (size > 30)) {
            std::cout << "incorrect number of invitations = "
                      << size
                      << ". Set 0 < number <= 30\n";
            return 3;
        }
        // Инициализируем массив
        invitations = new Invitation[size];
        fileInput = false;
        srand(static_cast<unsigned int>(time(0)));
    }
    else {
        // Вывод сообщения о некорректных аргументах командной строки
        errMessage2();
        return 2;
    }
    indexOfArray = -1;
    ofst = std::ofstream (argv[3]); // Инициализируем поток для вывода в файл
    auto threads = new std::thread[size]; // Создаем массив потоков
    for (int i = 0; i < size; ++i) {
        threads[i] = std::thread(func, i);
    }
    std::thread server(funcServer); // Создаем поток сервера
    // Ждем завершения работы всех потоков
    for (int i = 0; i < size; ++i) {
        threads[i].join();
    }
    server.join();
    return 0;
}
