def min array
    array.min
end


def max array
    array.max
end


def sum array
    array.sum
end


def product array
    product = 1
    array.each { |item| product *= item}
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