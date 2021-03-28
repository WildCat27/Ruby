require_relative "Employee"
require_relative "ListEmployee"

class TerminalViewListEmployee
    def initialize employees
        @employees = employees
    end

    def enter_value(validation)
        begin
            value = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)
            validation.call(value)
        rescue => exception
            puts exception.message
            retry
        end
    end

    def search_employee
        puts "Введите ФИО, электронную почту, телефон или паспорт:"
        param = STDIN.gets.chomp
        if Employee.fullname? param
            fullname = Employee.validate_fullname(param)
            emp = @employees.search_by_fullname(fullname)
        end
        if Employee.email? param
            email = Employee.validate_email(param)
            emp = @employees.search_by_email(email)
        end
        if Employee.phone? param
            phone = Employee.validate_phone(param)
            emp = @employees.search_by_phone(phone)
        end
        if Employee.passport? param
            passport = Employee.validate_passport(param)
            emp = @employees.search_by_passport(passport)
        end
        puts emp.to_s
    end

    def edit_employee(employee)
        employee = self.search

        menu = "Выберите поле для редактирования
            1 - ФИО;
            2 - дата рождения;
            3 - телефон;
            4 - адрес;
            5 - электронная почта;
            6 - паспорт;
            7 - специальность;
            8 - стаж"
        unless employee.experience == 0 then
            menu += ";
                9 - предыдущее место работы;
                10 - предыдущая должность;
                11 - предыдущая зарплата."
        else
            menu += "."
        end
        puts(menu.squeeze("\t"))

        param = STDIN.gets.chomp
        case param
        when "1"
            puts "Текущее значение: #{employee.fullname}"
            validate_fullname = Proc.new { |str| employee.validate_fullname(str)}
            employee.fullname = enter_value(validate_fullname)
        when "2"
            puts "Текущее значение: #{employee.birthdate}"
            validate_birthdate = Proc.new { |str| employee.validate_birthdate(str)}
            employee.birthdate = enter_value(validate_birthdate)
        when "3"
            puts "Текущее значение: #{employee.phone}"
            validate_phone = Proc.new { |str| employee.validate_phone(str)}
            employee.phone = enter_value(validate_phone)
        when "4"
            puts "Текущее значение: #{employee.address}"
            employee.address = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)
        when "5"
            puts "Текущее значение: #{employee.email}"
            validate_email = Proc.new { |str| employee.validate_email(str)}
            employee.email = enter_value(validate_email)
        when "6"
            puts "Текущее значение: #{employee.passport}"
            validate_passport = Proc.new { |str| employee.validate_passport(str)}
            employee.passport = enter_value(validate_passport)
        when "7"
            puts "Текущее значение: #{employee.speciality}"
            employee.speciality = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)
        when "8"
            puts "Текущее значение: #{employee.experience}"
            employee.experience  = enter_value(Integer)
        else
            unless experience == 0 then
                case param
                when "9"
                    puts "Текущее значение: #{employee.previous_workplace}"
                    employee.previous_workplace = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)
                when "10"
                    puts "Текущее значение: #{employee.previous_position}"
                    employee.previous_position = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)
                when "11"
                    puts "Текущее значение: #{employee.previous_wage}"
                    employee.previous_wage = enter_value(Integer)
                end
            end
        end
    end

    def add_employee
        
        puts "Введите информацию о работнике"

        puts "Фамилия Имя Отчество:"
        validate_fullname = Proc.new { |str| Employee.validate_fullname(str)}
        fullname = enter_value(validate_fullname)

        puts "Дата рождения:"
        validate_birthdate = Proc.new { |str| Employee.validate_birthdate(str)}
        birthdate = enter_value(validate_birthdate)

        puts "Телефон:"
        validate_phone = Proc.new { |str| Employee.validate_phone(str)}
        phone = enter_value(validate_phone)

        puts "Адрес:"
        address = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

        puts "Электронная почта:"
        validate_email = Proc.new { |str| Employee.validate_email(str)}
        email = enter_value(validate_email)

        puts "Пасрорт:"
        validate_passport = Proc.new { |str| Employee.validate_passport(str)}
        passport = enter_value(validate_passport)

        puts "Специальность:"
        speciality = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

        puts "Стаж:"
        experience = enter_value(Proc.new { |str| Integer(str)})

        unless experience == 0 then
            puts "Предыдущее место работы:"
            previous_workplace = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

            puts "Должность на предыдущем месте работы:"
            previous_position = (STDIN.gets.chomp).force_encoding("cp866").encode("utf-8", replace: nil)

            puts "Зароботная плата на предыдущем месте работы:"
            previous_wage = enter_value(Proc.new { |str| Integer(str)})

            employee = Employee.new(fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage)
        else
            employee = Employee.employee_without_experience(fullname, birthdate, phone, address, email, passport, speciality)
        end
        @employees.add(employee)
    end

    def delete_employee(employee)
        @employees.delete(employee)
    end

    def head
        puts "Количество выводимых записей"
        n = Integer(STDIN.gets.chomp)
        view_list(n)
    end

    def view_list(n = @employees.get.length)
        puts "Список пользователей:"
        @employees.get.each_with_index { |emp, i|
            break if i >= n
            puts("# #{i}")
            puts(emp.to_s)
        }
    end

    def view_table
        fields_length = Array.new(13, 0)
        employees = @employees.get
        fields_length[0] = employees.length.to_s.length

        employees.each { |emp|
            fields_length[1] = emp.fullname.length          > fields_length[1] ? emp.fullname.length        : fields_length[1]
            fields_length[2] = emp.birthdate.length         > fields_length[2] ? emp.birthdate.length       : fields_length[2]
            fields_length[3] = emp.phone.length             > fields_length[3] ? emp.phone.length           : fields_length[3]
            fields_length[4] = emp.address.length           > fields_length[4] ? emp.address.length         : fields_length[4]
            fields_length[5] = emp.email.length             > fields_length[5] ? emp.email.length           : fields_length[5]
            fields_length[6] = emp.passport.length          > fields_length[6] ? emp.passport.length        : fields_length[6]
            fields_length[7] = emp.speciality.length        > fields_length[7] ? emp.speciality.length      : fields_length[7]
            fields_length[8] = emp.experience.to_s.length   > fields_length[8] ? emp.experience.to_s.length : fields_length[8]

            unless emp.experience == 0 then 
                fields_length[9]    = emp.previous_workplace.length  > fields_length[9]  ? emp.previous_workplace.length  : fields_length[9]
                fields_length[10]   = emp.previous_position.length   > fields_length[10] ? emp.previous_position.length   : fields_length[10]
                fields_length[11]   = emp.previous_wage.to_s.length  > fields_length[11] ? emp.previous_wage.to_s.length  : fields_length[11]
            end
        }

        fields_length.map! { |f| f + 3 }

        puts("".ljust(fields_length[0]) + "fullname".ljust(fields_length[1]) + "birthdate".ljust(fields_length[2]) + "phone".ljust(fields_length[3]) +"address".ljust(fields_length[4]) + "E-Mail".ljust(fields_length[5]) + "passport".ljust(fields_length[6]) + "speciality".ljust(fields_length[7]) + "experience".ljust(fields_length[8]) + "previous_workplace".ljust(fields_length[9]) + "previous_position".ljust(fields_length[10]) + "previous_wage".ljust(fields_length[11]))

        employees.each_with_index { |emp, i|
            out = i.to_s.ljust(fields_length[0]) + emp.fullname.ljust(fields_length[1]) + emp.birthdate.ljust(fields_length[2]) + emp.phone.ljust(fields_length[3]) + emp.address.ljust(fields_length[4]) + emp.email.ljust(fields_length[5]) + emp.passport.ljust(fields_length[6]) + emp.speciality.ljust(fields_length[7]) + emp.experience.to_s.ljust(fields_length[8])

            unless emp.experience == 0 then
                out += emp.previous_workplace.ljust(fields_length[9]) + emp.previous_position.ljust(fields_length[10]) + emp.previous_wage.to_s.ljust(fields_length[11])
            end

            puts(out)
        }
    end

    def sort
        puts ""
        param = STDIN.gets.chomp
        case param
        when "1"
            @employees.sort_by_fullname!
        when "2"
            @employees.sort_by_birthdate!
        when "3"
            @employees.sort_by_phone!
        when "4"
            @employees.sort_by_address!
        when "5"
            @employees.sort_by_email!
        when "6"
            @employees.sort_by_passport!
        when "7"
            @employees.sort_by_speciality!
        when "8"
            @employees.sort_by_experience!
        when "9"
            @employees.sort_by_previous_workplace!
        when "10"
            @employees.sort_by_previous_position!
        when "11"
            @employees.sort_by_previous_wage!
        end
    end

    def save_to_file(filename)
        @employees.to_json(filename)
    end

end