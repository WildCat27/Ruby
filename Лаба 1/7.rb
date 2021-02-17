# method 1
def gcd a, b
    a, b = b, a if a < b
    remainder = a % b
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

        result = (coprime x, numbers).join(", ")
        puts "Числа #{result} взаимнопростые с числом #{x}" if result.length > 1
        puts "Число #{result} взаимнопростое с числом #{x}" if result.length == 1
        puts "Чисел, взаимнопростых с числом #{x}, не нашлось" if result.length == 0
    when "2"
        puts "Введите число"
        x = Integer(STDIN.gets.chomp)

        sum = multiples_of_3 x
        puts "Сумма цифр числа #{x}, делящихся на 3, равна #{sum}"
    else
        puts "Hello World"
    end
end

main