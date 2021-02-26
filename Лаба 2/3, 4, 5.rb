def read_list_1 n
    list = Array.new
    0.upto(n - 1) do |i|
        item = STDIN.gets.chomp
        list.insert(i, item)
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

list =  if is_number? ARGV[0] then read_list_1 Integer(ARGV[0]) else read_list_from_file ARGV[0] end
print list