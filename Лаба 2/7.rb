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
    
    
task = ARGV[0]
    
case task
when "1"
    puts "Индекс минимального элемента - #{input_array.min}"
when "2"
    puts "Введите a"
    a = Integer(STDIN.gets.chomp)
    
    puts "Введите b"
    b = Integer(STDIN.gets.chomp)
        
    puts "Количество элементов в интервале (#{a}; #{b}) - #{input_array.count { |item| a < item && item < b }}"
when "3"
    a = input_array
    unless (c = a.rindex(a.min) - a.index(a.min) - 1) == -1 
        puts "Количество элементов между первым и последним минимальным - #{c}"
    else
        puts "Найден только один минимальный элемент"
    end
when "4"
    puts "Введите a"
    a = Integer(STDIN.gets.chomp)
    
    puts "Введите b"
    b = Integer(STDIN.gets.chomp)
    
    puts "Количество элементов, принадлежащих отрезку [#{a}; #{b}], - #{input_array.count { |item| a <= item && item <= b }}"
when "5"
    list1 = input_array
    list2 = input_array
    
    puts "Элементы, не входящие в пересечение, - #{list1.union(list2) - list1.intersection(list2)}"
end