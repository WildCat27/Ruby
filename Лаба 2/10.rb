def get_dates string
    regex = /(\d\d?\s)(марта|апреля|мая)(\s\d+)/i
    dates = string.scan(regex)
    dates.map { |date| date.join}
end


if ARGV[0].empty? then
    puts "Введите строку"
    str = STDIN.gets.chomp
else
    str = ARGV[0]
end

puts get_dates str