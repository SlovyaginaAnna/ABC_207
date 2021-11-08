from animals import *
import random
import string

class Bird(Animals):
    def __init__(self):
        self.name = ""
        self.weight = 0
        self.migratory = False

    # Чтение птицы из массива
    def ReadStrArray(self, strArray, i):
        if i >= len(strArray) - 3:
            return 0
        self.name = strArray[i]
        self.weight = int(strArray[i+1])
        # Проверка на корректность веса
        if self.weight <= 0:
            self.weight = random.randint(100, 5000)
        migratory = int(strArray[i+2])
        # Проверка на корректность переменной
        if migratory < 0 or migratory > 1:
            self.migratory = bool(random.randint(0, 1))
        else:
            self.migratory = bool(migratory)
        i += 3
        return i

    # Рандомное заполнение птицы
    def FillRandomly(self):
        # Длина имени
        len = random.randint(3, 15)
        self.name = ""
        for i in range(len):
            self.name += random.choice(string.ascii_letters)
        self.weight = random.randint(100, 5000)
        self.migratory = bool(random.randint(0, 1))
        pass

    # Вывод птицы в консоль
    def Print(self):
        print(f"Bird: name = {self.name}  weight = {self.weight}  migratory = {self.migratory}, Division = {self.Division()}")
        pass

    # Запись птицы в файл
    def Write(self, ostream):
        ostream.write(f"Bird: name = {self.name}  weight = {self.weight}  migratory = {self.migratory}, Division = {self.Division()}")
        pass

    # Функция возвращающая среднее арифметическое цифр имени
    def Division(self):
        sum = 0.0
        for i in self.name:
            sum += ord(i)
        return sum/self.weight
        pass
