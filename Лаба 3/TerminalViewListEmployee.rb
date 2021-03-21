require_relative "Employee"
require_relative "ListEmployee"

class TerminalViewListEmployee
    def initialize employees
        @employees = employees
    end

    def EnterValue validation
        begin
            value = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)
            validation.call value
        rescue => exception
            puts exception.message
            retry
        end
    end

    def AddEmployee
        
        puts "Введите информацию о работнике"

        puts "Фамилия Имя Отчество:"
        fullname    = EnterValue(Employee.ValidateFullName)

        puts "Дата рождения:"
        birthdate   = EnterValue(Employee.ValidateBirthDate)

        puts "Телефон: #{@phone}"
        phone       = EnterValue(Employee.ValidatePhone)

        puts "Адрес: #{@address}"
        address     = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

        puts "Электронная почта:"
        email       = EnterValue(Employee.ValidateEmail)

        puts "Пасрорт: #{@passport}"
        passport    = EnterValue(Employee.ValidatePassport)

        puts "Специальность: #{@speciality}"
        speciality  = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

        puts "Стаж: #{@experience}"
        experience  = EnterValue(Integer)

        if @experience != 0 then
            puts "Предыдущее место работы: #{@previous_workplace}"
            previous_workplace = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

            puts "Должность на предыдущем месте работы: #{@previous_position}"
            previous_position = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

            puts "Зароботная плата на предыдущем месте работы: #{@previous_wage}"
            previous_wage = EnterValue(Integer)

            employee = Employee.new(fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage)
        else
            employee = Employee.EmployeeWithoutExperience(fullname, birthdate, phone, address, email, passport, speciality)
        end
        @employees.Add(employee)
    end

    def ViewList
        puts "Список пользователей:"
        @employees.Get.each { |emp|
            emp.ShowInfo
        }
    end

    def ViewTable
        fields_length = Array.new
        employees = @employees.Get

        fullnames = employees.map { |emp| emp.FullName.length }
        fields_length.push((fullnames + [8]).max)

        birthdates = employees.map { |emp| emp.Birthdate.length }
        fields_length.push((birthdates + [9]).max)

        phones = employees.map { |emp| emp.Phone.length }
        fields_length.push((phones + [5]).max)

        addresses = employees.map { |emp| emp.Address.length }
        fields_length.push((addresses + [7]).max)

        emails = employees.map { |emp| emp.EMail.length }
        fields_length.push((emails + [6]).max)

        passports = employees.map { |emp| emp.Passport.length }
        fields_length.push((passports + [8]).max)

        specialities = employees.map { |emp| emp.Speciality.length }
        fields_length.push((specialities + [9]).max)

        experiences = employees.map { |emp| emp.Experience.to_s.length }
        fields_length.push((experiences + [10]).max)
=begin
        previous_workplaces = employees.map { |emp| emp.PreviousWorkplace.length }
        fields_length.push((previous_workplaces + [17]).max)

        previous_positions = employees.map { |emp| emp.PreviousWosition.length }
        fields_length.push((previous_positions + [16]).max)

        previous_wages = employees.map { |emp| emp.PreviousWage.to_s.length }
        fields_length.push((previous_wages + [12]).max)
=end

        fields_length.map! { |f| f + 3 }

        puts("Fullname".ljust(fields_length[0]) + "Birthdate".ljust(fields_length[1]) + "Phone".ljust(fields_length[2]) +"Address".ljust(fields_length[3]) + "E-Mail".ljust(fields_length[4]) + "Passport".ljust(fields_length[5]) + "Speciality".ljust(fields_length[6]) + "Experience".ljust(fields_length[7]))#,"PreviousWorkplace".ljust(fields_length[8]), "PreviousPosition".ljust(fields_length[9]), "PreviousWage".ljust(fields_length[10]))

        employees.each_with_index { |emp, i|
            puts(emp.FullName.ljust(fields_length[0]) + emp.Birthdate.ljust(fields_length[1]) + emp.Phone.ljust(fields_length[2]) + emp.Address.ljust(fields_length[3]) + emp.EMail.ljust(fields_length[4]) + emp.Passport.ljust(fields_length[5]) + emp.Speciality.ljust(fields_length[6]) + emp.Experience.to_s.ljust(fields_length[7]))#, emp.PreviousWorkplace.ljust(fields_length[8]), emp.PreviousPosition.ljust(fields_length[9]), emp.PreviousWage.ljust(fields_length[10]))
        }
    end

end