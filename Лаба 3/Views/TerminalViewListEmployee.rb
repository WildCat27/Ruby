require_relative "../Models/Employee"
require_relative "../Models/ListEmployee"


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
        value = STDIN.gets.chomp
        if Employee.fullname? value
            fullname = Employee.validate_fullname(value)
            emp = @employees.search_by(:fullname, fullname)
        end
        if Employee.email? value
            email = Employee.validate_email(value)
            emp = @employees.search_by(:email, email)
        end
        if Employee.phone? value
            phone = Employee.validate_phone(value)
            emp = @employees.search_by(:phone, phone)
        end
        if Employee.passport? value
            passport = Employee.validate_passport(value)
            emp = @employees.search_by(:passport, passport)
        end
        puts emp.to_s
    end

    def edit_employee
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

            puts "Заработная плата на предыдущем месте работы:"
            previous_wage = enter_value(Proc.new { |str| Integer(str)})

            employee = Employee.new(fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage)
        else
            employee = Employee.employee_without_experience(fullname, birthdate, phone, address, email, passport, speciality)
        end
        @employees.add(employee)
    end

    def delete_employee
        employee = self.search
        puts(employee.to_s)
        puts("Удалить? [Да/Нет]")
        answer = STDIN.gets.chomp.downcase
        @employees.delete(employee) if answer == "да"
    end

    def view_list
        puts "Список пользователей:"
        @employees.get.each_with_index { |emp, i|
            puts("# #{i}")
            puts(emp.to_s)
        }
    end

    def sort_and_view_n
        puts("Введите количество записей для отображения:")
        n = Integer(STDIN.gets.chomp)

        puts("Введите номера полей без пробелов в порядке уменьшения приоритета при сортировке:")
        puts("
            1 - ФИО;
            2 - дата рождения;
            3 - телефон;
            4 - адрес;
            5 - электронная почта;
            6 - паспорт;
            7 - специальность;
            8 - стаж;
            9 - предыдущее место работы;
            10 - предыдущая должность;
            11 - предыдущая зарплата.
            ".squeeze("\t"))

        params = {
            "1": :fullname,
            "2": :birthdate,
            "3": :phone,
            "4": :address,
            "5": :email,
            "6": :passport,
            "7": :speciality,
            "8": :experience,
            "9": :previous_workplace,
            "10": :previous_position,
            "11": :previous_wage
        }

        selected_params = STDIN.gets.chomp
        sorted = @employees.sort_by(selected_params.chars.map { |i|
            params[i]
        })

        puts "Список пользователей:"
        sorted.each_with_index { |emp, i|
            break if i >= n
            puts("# #{i}")
            puts(emp.to_s)
        }
    end

    def save_to_file(filename)
        @employees.to_json(filename)
    end

end