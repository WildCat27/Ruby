require 'descriptive_statistics'

def mean string
    ascii = string.chars.map { |ch| Integer(ch.ord) }
    ascii.mean
end

def squared_deviation_from string, mean
    ascii = string.chars.map { |ch| Integer(ch.ord) }
    Math.sqrt(ascii.map { |i| (i - mean) ** 2 }.sum / ascii.length)
end

if ARGV[0] == nil then
    puts "Введите имя файла"
    filename = STDIN.gets.chomp
else
    filename = ARGV[0]
end
lines = IO.readlines(filename, chomp: true)

puts "Введите номер задачи:
       1 - Упорядочить по длине строки;
       2 - Упорядочить по количеству слов;
       3 - Упорядочить по количеству слов, идущих после чисел;
       Отсортировать строки в указанном порядке:
       4 - В порядке увеличения среднего веса ASCII-кода символа строки;
       5 - В порядке увеличения квадратичного отклонения среднего веса ASCII-кода 
       символа строки от среднего веса ASCII-кода символа первой строки."
task = STDIN.gets.chomp
case task
when "1"
    out = lines.sort { |s1, s2| s1.length <=> s2.length }
when "2"
    out = lines.sort { |s1, s2| s1.split.length <=> s2.split.length }
when "3"
    regex = /\d+(.\d+)?\s[a-z]+/i
    out = lines.sort { |s1, s2| s1.scan(regex).length <=> s2.scan(regex).length }
when "4"
    out = lines.sort { |s1, s2| mean(s1) <=> mean(s2) }
when "5"
    mean = mean lines[0]
    out = lines.sort { |s1, s2| squared_deviation_from(s1, mean) <=> squared_deviation_from(s2, mean) }
end

IO.write("Лаба 2\\out_12.txt", out.join("\n"))