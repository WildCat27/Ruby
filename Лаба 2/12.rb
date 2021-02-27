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
       3 - Упорядочить по количеству слов, идущих после чисел;"
task = STDIN.gets.chomp
case task
when "1"
    out = lines.sort { |s1, s2| s1.length <=> s2.length }
when "2"
    out = lines.sort { |s1, s2| s1.split.length <=> s2.split.length }
when "3"
    regex = /\d+(.\d+)?\s[a-z]+/i
    out = lines.sort { |s1, s2| s1.scan(regex).length <=> s2.scan(regex).length }
end

IO.write("Лаба 2\\out_12.txt", out.join("\n"))

