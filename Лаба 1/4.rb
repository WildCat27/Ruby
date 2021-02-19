puts "Привет, #{ARGV[0]}. Любимый язык программирования?"

fav_lang = STDIN.gets.chomp

puts "Ого!" if fav_lang == "Assembler"
puts "крутой(X) :- знает_пролог(X)" if fav_lang == "Prolog"
puts "Забацай мне сайтик" if fav_lang == "Php"

=begin
    
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
    
=end
