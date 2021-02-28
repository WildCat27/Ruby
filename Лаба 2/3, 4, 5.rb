def read_list_1 n
    list = Array.new
    0.upto(n - 1) do |i|
        item = STDIN.gets.chomp
        list.insert(i, item)
    end
    list
end


def read_list_2 n
    list = Array.new
    n.times do |i|
        item = STDIN.gets.chomp
        list.push item
    end
    list
end


def read_list_3 n
    list = Array.new
    0.upto(n - 1) do |i|
        item = STDIN.gets.chomp
        list[i] = item
    end
    list
end


def read_list_from_file filename
    file = open filename
    lines = []
    while (line = file.gets)
        lines.push line.chomp
    end
    lines
end


def is_number? string
    true if Integer(string) rescue false
end


unless is_number? ARGV[0]
    list = read_list_from_file ARGV[0]
else
    puts "Введите количество элементов"
    n = Integer STDIN.gets.chomp

    puts "Введите список"
    case ARGV[0]
    when "1"
        list = read_list_1 n
    when "2"
        list = read_list_2 n
    when "3"
        list = read_list_3 n
    end
end
print list