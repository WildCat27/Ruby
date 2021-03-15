def lowercase_ordered? string
    lowercases = string.chars.filter { |ch| ch =~ /[a-z]/}
    lowercases == lowercases.sort
end


def uppercase_palindrome? string
    uppercases = string.chars.filter { |ch| ch =~ /[A-Z]/}
    uppercases == uppercases.reverse
end


def filename string
    string.scan(/([^\\]+)\.[A-Za-z0-9]+$/)
end


puts "Введите номер задачи:
       1 - Найти максимальный;
       2 - Проверить, упорядочены ли строчные символы строки по возрастанию;
       3 - Проверить, образуют ли прописные символы строки палиндром;
       4 - Найти имя файла без расширения."
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
when "3"
    puts "Введите строку"
    str = STDIN.gets.chomp
    if uppercase_palindrome? str
        puts "Есть палиндром"
    else
        puts "Палиндром не найден" 
    end
when "4"
    puts "Введите строку"
    str = STDIN.gets.chomp
    puts "Имя файла -  #{filename str}"
end