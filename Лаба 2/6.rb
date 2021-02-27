def in_interval array, a, b
    count = 0
    for item in array
        count += 1 if a < item && item < b
    end
    count
end

task = ARGV[0]

case task
when "1"
    puts "Введите число элементов"
    n = Integer(STDIN.gets.chomp)

    puts "Введите массив"
    array = Array.new

    n.times do |i|
        array.push Integer(STDIN.gets.chomp)
    end

    puts "Введите a"
    a = Integer(STDIN.gets.chomp)

    puts "Введите b"
    b = Integer(STDIN.gets.chomp)

    puts "Количество элементов в интервале (#{a}; #{b}) - #{in_interval array, a, b}"
end