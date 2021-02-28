require 'set'

def get_dates string
    regex = /(\d\d?\s)(марта|апреля|мая)(\s\d+)/i
    dates = string.scan(regex)
    dates.map { |date| date.join}
end

def get_lowercase string
    lowercase = string.chars.filter { |ch| ch =~ /[a-z]/}
    lowercase.to_set.to_a
end

if ARGV[0] == nil then
    puts "Введите строку"
    str = STDIN.gets.chomp
else
    str = ARGV[0]
end

puts "Введите номер задачи:
       1 - Найти все даты, которые описаны в виде \"31 февраля 2007\";
       2 - Найти все строчные символы латиницы, которые в ней используются."
task = STDIN.gets.chomp
case task
when "1"
    puts get_dates str
when "2"
    puts (get_lowercase str).join " "
end
