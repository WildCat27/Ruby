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

    def Search
        puts "Введите номер параметра поиска:
            1 - ФИО;
            2 - электронная почта;
            3 - телефон;
            4 - паспорт."
        param = STDIN.gets.chomp
        case param
        when "1"
            puts "Введите ФИО:"
            fullname = Employee.ValidateFullName(STDIN.gets.chomp)
            employee = @List.SearchByFullname(fullname)
        when "2"
            puts "Введите электронную почту:"
            email = Employee.ValidateEmail(STDIN.gets.chomp)
            employee = @List.SearchByFullname(email)  
        when "3"
            puts "Введите телефон:"
            phone = Employee.ValidatePhone(STDIN.gets.chomp)
            employee = @List.SearchByFullname(phone)
        when "4"
            puts "Введите паспорт:"
            passport = Employee.ValidatePassport
            employee = @List.SearchByFullname(passport)
        end
        employee.ShowInfo
    end

    def Edit employee
        menu = "Выберите поле для редактирования
            1 - ФИО;
            2 - дата рождения;
            3 - телефон;
            4 - адрес;
            5 - электронная почта;
            6 - паспорт;
            7 - специальность;
            8 - стаж"
        unless employee.Experience == 0 then
            menu += ";
                9 - предыдущее место работы;
                10 - предыдущая должность;
                11 - предыдущая зарплата."
        else
            menu += "."
        end
        puts(menu.squeeze("\t"))

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
        @employees.Get.each_with_index { |emp, i|
            puts("# #{i}")
            emp.ShowInfo
        }
    end

    def ViewTable
        fields_length = Array.new(13, 0)
        employees = @employees.Get
        fields_length[0] = employees.length.to_s.length

        employees.each { |emp|
            fields_length[1] = emp.FullName.length          > fields_length[1] ? emp.FullName.length        : fields_length[1]
            fields_length[2] = emp.Birthdate.length         > fields_length[2] ? emp.Birthdate.length       : fields_length[2]
            fields_length[3] = emp.Phone.length             > fields_length[3] ? emp.Phone.length           : fields_length[3]
            fields_length[4] = emp.Address.length           > fields_length[4] ? emp.Address.length         : fields_length[4]
            fields_length[5] = emp.EMail.length             > fields_length[5] ? emp.EMail.length           : fields_length[5]
            fields_length[6] = emp.Passport.length          > fields_length[6] ? emp.Passport.length        : fields_length[6]
            fields_length[7] = emp.Speciality.length        > fields_length[7] ? emp.Speciality.length      : fields_length[7]
            fields_length[8] = emp.Experience.to_s.length   > fields_length[8] ? emp.Experience.to_s.length : fields_length[8]

            unless emp.Experience == 0 then 
                fields_length[9]    = emp.PreviousWorkplace.length  > fields_length[9]  ? emp.PreviousWorkplace.length  : fields_length[9]
                fields_length[10]   = emp.PreviousPosition.length   > fields_length[10] ? emp.PreviousPosition.length   : fields_length[10]
                fields_length[11]   = emp.PreviousWage.to_s.length  > fields_length[11] ? emp.PreviousWage.to_s.length  : fields_length[11]
            end
        }

        fields_length.map! { |f| f + 3 }

        puts("".ljust(fields_length[0]) + "Fullname".ljust(fields_length[1]) + "Birthdate".ljust(fields_length[2]) + "Phone".ljust(fields_length[3]) +"Address".ljust(fields_length[4]) + "E-Mail".ljust(fields_length[5]) + "Passport".ljust(fields_length[6]) + "Speciality".ljust(fields_length[7]) + "Experience".ljust(fields_length[8]) + "PreviousWorkplace".ljust(fields_length[9]) + "PreviousPosition".ljust(fields_length[10]) + "PreviousWage".ljust(fields_length[11]))

        employees.each_with_index { |emp, i|
            out = i.to_s.ljust(fields_length[0]) + emp.FullName.ljust(fields_length[1]) + emp.Birthdate.ljust(fields_length[2]) + emp.Phone.ljust(fields_length[3]) + emp.Address.ljust(fields_length[4]) + emp.EMail.ljust(fields_length[5]) + emp.Passport.ljust(fields_length[6]) + emp.Speciality.ljust(fields_length[7]) + emp.Experience.to_s.ljust(fields_length[8])

            unless emp.Experience == 0 then
                out += emp.PreviousWorkplace.ljust(fields_length[9]) + emp.PreviousPosition.ljust(fields_length[10]) + emp.PreviousWage.to_s.ljust(fields_length[11])
            end

            puts(out)
        }
    end

end