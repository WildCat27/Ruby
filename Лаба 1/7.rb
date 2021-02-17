# method 2
def multiples_of_3 number
    sum = 0
    while number > 0
        digit = number % 10
        sum += digit if digit % 3 == 0
        number /= 10
    end
    sum
end

puts multiples_of_3 Integer ARGV[0]