# Класс контейнера
class Container:
    def __init__(self):
        self.store = []

    # Запись содержимого контейнера в консоль
    def Print(self):
        print("Container is store", len(self.store), "animals: ")
        for animal in self.store:
            animal.Print()
        pass

    # Запись содержимого контейнера в файл
    def Write(self, ostream):
        ostream.write(f"Container is store {len(self.store)} animals:\n")
        for animals in self.store:
            animals.Write(ostream)
            ostream.write("\n")
        pass

    # Подсчет среднего арифметического функции
    def Division(self):
        sum = 0.0
        for an in self.store:
            sum += an.Division()
        if len(self.store) != 0:
            return sum/len(self.store)
        else:
            return 0
        pass
