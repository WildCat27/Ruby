number = ARGV[0]

def sum_of_digits number_str
    sum = 0
    number_str.each_char do |i|
        sum += Integer(i)
    end
    sum
end

def max_digit number_str
    max = Integer number_str[0]
    number_str.each_char do |i|
        max = Integer(i) if max < Integer(i)
    end
    max
end

def min_digit number_str
    min = Integer number_str[0]
    number_str.each_char do |i|
        min = Integer(i) if min > Integer(i)
    end
    min
end

def product_of_digits number_str
    product = 1
    number_str.each_char do |i|
        product *= Integer(i)
    end
    product
end


puts "Сумма цифр числа #{number} равна #{sum_of_digits number}"
puts "Максимальная цифра числа #{number} равна #{max_digit number}"
puts "Минимальная цифра числа #{number} равна #{min_digit number}"
puts "Произведение цифр числа #{number} равна #{product_of_digits number}"