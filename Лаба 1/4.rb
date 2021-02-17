puts "Привет, #{ARGV[0]}. Любимый язык программирования?"

fav_lang = STDIN.gets.chomp

case fav_lang
when "Ruby"
    puts "Подлиза"
when "C#"
    puts "Хороший вкус"
when "Python"
    puts "Классно"
when "Pascal"
    puts "Ну допустим"
when "Fortran"
    puts "Мне кажется, ты меня обманываешь"
else
    puts "Не знаю такого"
end