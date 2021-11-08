from animals import *
from enum import Enum
import random
import string

# Перечисление типов зверя
class Type(Enum):
    HERBIVOROUS = 0
    PREDATOR = 1
    INSECTIVOROUS = 2

# Класс зверя
class Beast(Animals):
    def __init__(self):
        self.name = ""
        self.weight = 0
        self.t = Type.HERBIVOROUS

    # Чтение зверя из массива
    def ReadStrArray(self, strArray, i):
        if i >= len(strArray) - 3:
            return 0
        self.name = strArray[i]
        self.weight = int(strArray[i+1])
        # Проверка на корректность веса
        if self.weight <= 0:
            self.weight = random.randint(100, 5000)
        t = int(strArray[i + 2])
        # Проверка на корректность типа
        if t < 0 or t > 2:
            self.t = random.randint(0, 2)
        else:
            self.t = t
        i += 3
        return i

    # Рандомное заполнение
    def FillRandomly(self):
        # Длина имени
        len = random.randint(3, 15)
        self.name = ""
        for i in range(len):
            self.name += random.choice(string.ascii_letters)
        self.weight = random.randint(100, 5000)
        self.t = random.randint(0, 2)
        pass

    # Вывод зверя в консоль
    def Print(self):
        if self.t == 0:
            typ = 'herbivorous'
        elif self.t == 1:
            typ = 'predator'
        elif self.t == 2:
            typ = 'insectivorous'
        print(f"Beast: name = {self.name}  weight = {self.weight}  type = {typ}, Division = {self.Division()}")
        pass

    # Запись зверя в файл
    def Write(self, ostream):
        if self.t == 0:
            typ = 'herbivorous'
        elif self.t == 1:
            typ = 'predator'
        elif self.t == 2:
            typ = 'insectivorous'
        ostream.write(f"Beast: name = {self.name}  weight = {self.weight}  type = {typ}, Division = {self.Division()}")
        pass

    # Функция возвращающая среднее арифметическое цифр имени
    def Division(self):
        sum = 0.0
        for i in self.name:
            sum += ord(i)
        return sum/self.weight
        pass
