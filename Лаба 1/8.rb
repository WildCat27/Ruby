# method 1
def gcd a, b
    a, b = b, a if a < b
    if b == 0 then
        return a
    else
        remainder = a % b
    end
    until remainder == 0
        a, b = b, remainder
        remainder = a % b
    end
    b
end

def coprime x, numbers
    cop = Array.new
    for num in numbers do
        cop.push num if (gcd x, num) == 1
    end
    cop
end

# method 2
def multiples_of_3 number
    sum = 0
    while number > 0
        digit = number % 10
        sum += digit if digit % 3 == 0
        number /= 10
    end
    sum
end

# method 3
def find_divider x, digits
    div, div_counter = 1, 0
    2.upto(x / 2) do |i|
        counter = (coprime i, digits).length
        if counter > div_counter && x % i == 0 then
            div = i 
            div_counter = counter
        end
    end
    div
end

def main
    method = ARGV[0]
    case method
    when "1"
        puts "Введите заданное число"
        x = Integer(STDIN.gets.chomp)
        
        numbers = Array.new
        puts "Введите числа (q - завершить ввод)"
        input = STDIN.gets.chomp
        while input != "q"
            numbers.push Integer(input)
            input = STDIN.gets.chomp
        end

        result = (coprime x, numbers)
        puts "Числа #{result.join(", ")} взаимно простые с числом #{x}" if result.length > 1
        puts "Число #{result.join(", ")} взаимно простое с числом #{x}" if result.length == 1
        puts "Чисел, взаимно простых с числом #{x}, не нашлось" if result.length == 0
    when "2"
        puts "Введите число"
        x = Integer(STDIN.gets.chomp)

        sum = multiples_of_3 x
        puts "Сумма цифр числа #{x}, делящихся на 3, равна #{sum}"
    when "3"
        puts "Введите число"
        input = STDIN.gets.chomp
        x = Integer(input)
        digits = input.chars.map { |char| Integer(char) }

        div = find_divider x, digits
        unless div == 1 then
            puts "Исключая 1, таким делителем будет #{div}"
        else
            puts "Кроме 1 нет делителей, взаимно простых с цифрами числа"
        end
    else
        puts "Cправка"
        puts "Метод 1. Найти количество чисел, взаимно простых с заданным."
        puts "Метод 2. Найти сумму цифр числа, делящихся на 3."
        puts "Метод 3. Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа."
    end
end

main