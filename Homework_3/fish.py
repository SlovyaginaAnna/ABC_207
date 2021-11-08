import string
from animals import *
from enum import Enum
import random

# Перечисление мест обитания рыб
class Habit(Enum):
    RIVER = 0
    LAKE = 1
    OCEAN = 2
    SEA = 3

# Класс рыб
class Fish(Animals):
    def __init__(self):
        self.name = ""
        self.weight = 0
        self.h = Habit.RIVER

    # Чтение рыбы из массива
    def ReadStrArray(self, strArray, i):
        if i >= len(strArray) - 3:
            return 0
        self.name = strArray[i]
        self.weight = int(strArray[i+1])
        # Проверка на корректность веса
        if self.weight <= 0:
            self.weight = random.randint(100, 5000)
        h = int(strArray[i+2])
        # Проверка на корректность переменной
        if h < 0 or h > 3:
            self.h = random.randint(0, 3)
        else:
            self.h = h
        i += 3
        return i

    # Рандомное заполнение рыбы
    def FillRandomly(self):
        # Длина имени
        len = random.randint(3, 15)
        self.name = ""
        for i in range(len):
            self.name += random.choice(string.ascii_letters)
        self.weight = random.randint(100, 5000)
        self.h = random.randint(0, 3)
        pass

    # Вывод рыбы в консоль
    def Print(self):
        if self.h == 0:
            hab = 'river'
        elif self.h == 1:
            hab = 'lake'
        elif self.h == 2:
            hab = 'ocean'
        elif self.h == 3:
            hab = 'sea'
        print(f"Fish: name = {self.name}  weight = {self.weight}  habit = {hab}, Division = {self.Division()}")
        pass

    # Запись рыбы в файл
    def Write(self, ostream):
        if self.h == 0:
            hab = 'river'
        elif self.h == 1:
            hab = 'lake'
        elif self.h == 2:
            hab = 'ocean'
        elif self.h == 3:
            hab = 'sea'
        ostream.write(f"Fish: name = {self.name}  weight = {self.weight}  habit = {hab}, Division = {self.Division()}")
        pass

    # Функция возвращающая среднее арифметическое цифр имени
    def Division(self):
        sum = 0.0
        for i in self.name:
            sum += ord(i)
        return sum/self.weight
        pass
