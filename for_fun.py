from random import randint
number = randint(1, 100)

def guess_number(num):
    guess = int(input('Введите число от 1 до 100'))
    if guess == number:
        print('Поздравляем, вы угадали!')
    