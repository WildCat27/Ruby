#coding: utf-8

require_relative "Employee"

class TestEmployee
    def Test
        employee1 = Employee.new "Цветкова", "Алиса", "Васильевна", "8-918-2613840", "ул. Жукова, 23", "7900-123456", "Арт-директор", "7", "ООО Катамаран", "Художник", 50_000
        employee2 = Employee.EmployeeWithoutExperience "Скворцов", "Даниил", "Витальевич", "8-918-446-55-66", "address", "7901-133446", "Программист"
        employee3 = Employee.new "Краснов", "Антон", "Денисович", "8-918-954-26-70", "address", "7900-448899", "Технический директор", "10", "ООО Фортуна", "Ведущий программист", 120_000

        employee1.ShowInfo
        employee2.ShowInfo
        employee3.ShowInfo
    end

    def Num
        "foo".casecmp(2)
        #name = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)
        if Date.strptime("09.02.2015", '%d.%m.%Y') 
            puts "correct"
        else
            puts "incorrect"
        end
    end
end

test = TestEmployee.new
test.Num