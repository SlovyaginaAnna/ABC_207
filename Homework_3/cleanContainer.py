from extender import *

# Функция удаление элементов контейнера
def CleanContainer (container):
    length = 0
    while length < len(container.store):
        # Проверка удовлетворяет ли элемент условию
        if container.store[length].Division() < container.Division():
            container.store.remove(container.store[length])
        length += 1
pass
