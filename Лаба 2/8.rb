if ARGV[0].empty? then
    puts "Введите список через пробел"
    str = STDIN.gets.chomp
else
    str = ARGV[0]
end

puts "Максимальный элемент - #{str.split.map { |i| Integer(i)}.max}"