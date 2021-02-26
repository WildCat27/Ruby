def min array
    min = array[0]
    for item in array
        min = item if item < min
    end
    min
end


def max array
    max = array[0]
    for item in array
        max = item if item > max
    end
    max
end


def sum array
    sum = 0
    for item in array
        sum += item
    end
    sum
end


def product array
    product = 1
    for item in array
        product *= item
    end
    product
end


puts "Введите элемены списка (q - завершить ввод):"
arr = Array.new
input = STDIN.gets.chomp
while input != "q"
    arr.concat(input.split.map { |i| Integer(i) })
    input = STDIN.gets.chomp
end

puts "Минимум - #{min arr}"
puts "Максимум - #{max arr}"
puts "Сумма - #{sum arr}"
puts "Произведение - #{product arr}"