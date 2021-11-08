from extender import *

# Функция для чтения чтения животных из массива
def ReadStrArray(container, strArray):
    arrayLen = len(strArray)
    i = 0
    figNum = 0
    while i < arrayLen:
        # Проверям тип животного
        key = strArray[i]
        if key == "1":
            i += 1
            animal = Fish()
            i = animal.ReadStrArray(strArray, i)
        elif key == "2":
            i += 1
            animal = Bird()
            i = animal.ReadStrArray(strArray, i)
        elif key == "3":
            i += 1
            animal = Beast()
            i = animal.ReadStrArray(strArray, i)
        else:
            return figNum
        if i == 0:
            return figNum
        figNum += 1
        # Добавление животного в контейнер
        container.store.append(animal)
    return figNum
