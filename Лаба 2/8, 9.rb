def lowercase_ordered? string
    lowercase = string.chars.filter { |ch| ch =~ /[a-z]/}
    lowercase == lowercase.sort
end

puts "Введите номер задачи:
       1 - Найти максимальный;
       2 - Проверить, упорядочены ли строчные символы строки по возрастанию."
task = STDIN.gets.chomp
case task
when "1"
    puts "Введите список через пробел"
    str = STDIN.gets.chomp
    puts "Максимальный элемент - #{str.split.map { |i| Integer(i)}.max}"
when "2"
    puts "Введите строку"
    str = STDIN.gets.chomp
    if lowercase_ordered? str
        puts "Упорядочены"
    else
        puts "Не упорядочены" 
    end
end