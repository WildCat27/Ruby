def input_array
puts "Введите число элементов"
    n = Integer(STDIN.gets.chomp)

    puts "Введите массив"
    array = Array.new

    n.times do |i|
        array.push Integer(STDIN.gets.chomp)
    end
    array
end


def min_index array
    min_index = 0
    min = array[0]
    1.upto(array.length - 1) do |i|
        if array[0] < min
            min = array[0]
            min_index = i
        end
    end
    min_index
end


def in_interval array, a, b
    count = 0
    for item in array
        count += 1 if a < item && item < b
    end
    count
end


def count_between_mins array
    first, last = 0, 0
    min = array[0]
    1.upto(array.length - 1) do |i|
        if array[i] < min
            first = last = i
            min = array[i]
        end
        if array[i] == min
            last = i
        end
    end
    last - first - 1
end


task = ARGV[0]

case task
when "1"
    puts "Индекс минимального элемента - #{min_index input_array}"
when "2"
    puts "Введите a"
    a = Integer(STDIN.gets.chomp)

    puts "Введите b"
    b = Integer(STDIN.gets.chomp)

    puts "Количество элементов в интервале (#{a}; #{b}) - #{in_interval input_array, a, b}"
when "3"
    unless (c = count_between_mins input_array) == -1 
        puts "Количество элементов между первым и последним минимальным - #{c}"
    else
        puts "Найден только один минимальный элемент"
    end
end