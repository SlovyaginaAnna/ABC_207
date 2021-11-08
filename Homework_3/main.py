import sys
from extender import *

if __name__ == '__main__':
    # Проверяем корректное ли число параметров
    if len(sys.argv) == 4:
        # Смотри на первый аргумент
        if sys.argv[1] == "-f":
            inputFileName  = sys.argv[2]
            outputFileName = sys.argv[3]
            ifile = open(inputFileName)
            # Чтение из файла
            str = ifile.read()
            ifile.close()
            # Создание массива
            strArray = str.replace("\n", " ").split(" ")
            print('==> Start')
            container = Container()
            # Заполнение контейнера
            animNum = ReadStrArray(container, strArray)
            container.Print()
            ofile = open(outputFileName, 'w')
            # Запись в файл контейнера
            container.Write(ofile)
            ofile.write(f"\nDivision result  = {container.Division()}\n")
            print("\nDivision result  = ", container.Division())
            print("Container after deleting:")
            # Очищение контейнера
            CleanContainer(container)
            container.Print()
            # Запись в файл контейнера
            ofile.write(f"\nContainer after deleting:\n")
            container.Write(ofile)
            ofile.close()

            print('==> Finish')
        elif sys.argv[1] == "-n":
            outputFileName = sys.argv[2]
            len = int(sys.argv[3])
            container = Container()
            # Рандомное заполнение контейнера
            FillRandomly(container, len)
            print('==> Start')
            container.Print()
            ofile = open(outputFileName, 'w')
            # Запись контейнера в файл
            container.Write(ofile)
            ofile.write(f"\nDivision result  = {container.Division()}\n")
            print("\nDivision result  = ", container.Division())
            # Очищенее контейнера
            CleanContainer(container)
            ofile.write(f"\nContainer after deleting:\n")
            print("Container after deleting:")
            container.Print()
            container.Write(ofile)
            ofile.close()
            print('==> Finish')
        else:
            # Сообщение о некорректном вводе
            print("Incorrect command line!")
            exit()
    else:
        # Сообщение о некорректном вводе
        print("Incorrect command line!")
        exit()
