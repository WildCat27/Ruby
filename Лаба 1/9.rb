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

        numbers.filter! { |num| num.gcd(x) == 1}
        puts "Числа #{numbers.join(", ")} взаимно простые с числом #{x}" if numbers.length > 1
        puts "Число #{numbers.join(", ")} взаимно простое с числом #{x}" if numbers.length == 1
        puts "Чисел, взаимно простых с числом #{x}, не нашлось" if numbers.length == 0
    when "2"
        puts "Введите число"
        x = Integer(STDIN.gets.chomp)

        sum = (x.digits.filter { |digit| digit % 3 == 0}).sum

        puts "Сумма цифр числа #{x}, делящихся на 3, равна #{sum}"
    when "3"
        puts "Введите число"
        x = Integer(STDIN.gets.chomp)

        count_comprimes = Proc.new { |i| 
            x.digits.count { |digit| 
                i.gcd(digit) == 1
                } 
            }

        dividers = (2..x / 2).filter { |i| x % i == 0 }
        div = dividers.max { |a, b| count_comprimes.call(a) <=> count_comprimes.call(b) }

        unless div == 1 then
            puts "Исключая 1, таким делителем будет #{div}"
        else
            puts "Кроме 1 нет делителей, взаимно простых с цифрами числа #{x}"
        end
    else
        puts "Cправка"
        puts "Метод 1. Найти количество чисел, взаимно простых с заданным."
        puts "Метод 2. Найти сумму цифр числа, делящихся на 3."
        puts "Метод 3. Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа."
    end
end

main