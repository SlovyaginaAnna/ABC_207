from extender import *
import random

# Функция рандомного заполнения животных
def FillRandomly (container, len):
    for i in range(len):
        i = random.randint(1, 3)
        if i == 1:
            animal = Fish()
        elif i == 2:
            animal = Bird()
        elif i == 3:
            animal = Beast()
        animal.FillRandomly()
        container.store.append(animal)
pass
