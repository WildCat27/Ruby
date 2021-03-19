require_relative "math_9"

def task_1
    puts "Введите заданное число"
    x = Integer(STDIN.gets.chomp)
        
    numbers = Array.new
    puts "Введите числа (q - завершить ввод)"
    input = STDIN.gets.chomp
    while input != "q"
        numbers.push Integer(input)
        input = STDIN.gets.chomp
    end

    result = Tasks::coprime(x, numbers)
    puts "Числа #{result.join(", ")} взаимно простые с числом #{x}" if result.length > 1
    puts "Число #{result.join(", ")} взаимно простое с числом #{x}" if result.length == 1
    puts "Чисел, взаимно простых с числом #{x}, не нашлось" if result.length == 0
end


def task_2
    puts "Введите число"
    x = Integer(STDIN.gets.chomp)

    sum = Tasks::multiples_of_3(x)
    puts "Сумма цифр числа #{x}, делящихся на 3, равна #{sum}"
end


def task_3
    puts "Введите число"
    x = Integer(STDIN.gets.chomp)

    digits = Tasks::digits(x)
    dividers = Tasks::dividers(x)
    
    div = Tasks::super_coprime(dividers, digits)
    if div then
        puts "Исключая 1, таким делителем будет #{div}"
    else
        puts "Кроме 1 нет делителей, взаимно простых с цифрами числа"
    end
end


def get_help
    puts "Cправка"
    puts "Задача 1. Найти количество чисел, взаимно простых с заданным."
    puts "Задача 2. Найти сумму цифр числа, делящихся на 3."
    puts "Задача 3. Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа."
end


def main
    ARGV.map { |method|
        case method
        when "1"
            puts "# Задача 1"
            task_1
        when "2"
            puts "# Задача 2"
            task_2
        when "3"
            puts "# Задача 3"
            task_3
        else
            get_help
        end
    }
end

main