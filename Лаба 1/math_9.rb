# Работа с числами с использованием 
module Tasks

    # Возвращает массив чисел, взаимно простных с некоторым заданным числом
    # @param x [Integer] заданное число
    # @param numbers [Array] числа, среди которых ищутся взаимно простые с x
    def Tasks.coprime x, numbers
        numbers.filter { |num| num.gcd(x) == 1}
    end
    

    # Возвращает сумму цифр числа, делящихся на 3
    def Tasks.multiples_of_3(number)
        (number.digits.filter { |digit| digit % 3 == 0}).sum
    end


    # Возвращает массив цифр числа
    def Tasks.digits(x)
        x.digits
    end


    # Возвращает массив делителей числа (без единицы)
    def Tasks.dividers(x)
        (2..x).filter { |i| x.remainder(i) == 0 }
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
