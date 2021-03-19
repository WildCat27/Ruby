# Работа с числами
module Tasks
    # Возвращает НОД двух чисел
    def Tasks.gcd(a, b)
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

    # Возвращает массив чисел, взаимно простных с некоторым заданным числом
    # @param x [Integer] заданное число
    # @param numbers [Array] числа, среди которых ищутся взаимно простые с x
    def Tasks.coprime(x, numbers)
        cop = Array.new
        for num in numbers do
            cop.push num if (gcd x, num) == 1
        end
        cop
    end

    # Возвращает сумму цифр числа, делящихся на 3
    def Tasks.multiples_of_3(number)
        sum = 0
        while number > 0
            digit = number % 10
            sum += digit if digit % 3 == 0
            number /= 10
        end
        sum
    end

    # Возвращает массив цифр числа
    def Tasks.digits(x)
        digits = Array.new
        while x > 0
            digits.push x % 10
            x /= 10
        end
        digits
    end

    # Возвращает массив делителей числа (без единицы)
    def Tasks.dividers(x)
        (2..x).filter { |i| x % i == 0 }
    end

    # Возвращает число из первого массива, взаимно простое с наибольшим количеством чисел из второго массива
    def Tasks.super_coprime(array1, array2)
        array1.filter! { |a|
            (coprime a, array2).length != 0
        }
        array1.max { |a, b|
            (coprime a, array2).length <=> (coprime b, array2).length
        }
    end
end
