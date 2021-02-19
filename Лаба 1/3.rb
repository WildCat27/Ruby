puts "Введите команду ОС:"
os_cmd = "`#{STDIN.gets.chomp}`"

puts "Введите команду Ruby:"
ruby_cmd = STDIN.gets.chomp

puts "Результат выполнения команды ОС:"
eval("puts #{os_cmd}")

puts "Результат выполнения команды Ruby:"
puts eval(ruby_cmd)
