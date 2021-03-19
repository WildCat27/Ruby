require 'descriptive_statistics'


def ascii string
    string.chars.map { |ch| Integer(ch.ord) }
end



def dis_3 array
    array.combination(3).to_a.map { |a| a.mean }
end


def squared_deviation_from array, x
    Math.sqrt(array.map { |i| (i - x) ** 2 }.sum / array.length)
end


def difference string
    p1 = string.scan(/[aeouy][(^aeouy)a-z]/)
    p2 = string.scan(/[(^aeouy)a-z][aeouy]/)
    p1 - p1
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
       символа строки от среднего веса ASCII-кода символа первой строки;
       6 - В порядке увеличения разницы между количеством сочетаний 
       «гласная-согласная» и «согласная-гласная» в строке;
       7 - В порядке квадратичного отклонения дисперсии максимального
       среднего веса ASCII-кода тройки символов в строке от максимального
       среднего веса ASCII-кода тройки символов в первой строке."
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
    out = lines.sort { |s1, s2| ascii(s1).mean <=> ascii(s2).mean }
when "5"
    mean = ascii(lines[0]).mean
    out = lines.sort { |s1, s2| squared_deviation_from(ascii(s1), mean) <=> squared_deviation_from(ascii(s2), mean) }
when "6"
    out = lines.sort { |s1, s2| difference(s1) <=> difference(s2) }
when "7"
    dis_3_max = dis_3(ascii(lines[0])).max
    out = lines.sort { |s1, s2| squared_deviation_from(ascii(s1), dis_3_max) <=> squared_deviation_from(ascii(s2), dis_3_max) }
end

IO.write("out_12.txt", out.join("\n"))