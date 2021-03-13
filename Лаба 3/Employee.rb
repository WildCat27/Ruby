class Employee
    def self.EmployeeWithoutExperience last_name, name, middle_name, phone, address, passport, speciality
        Employee.new last_name, name, middle_name, phone, address, passport, speciality, 0, nil, nil, nil
    end

    def initialize last_name, name, middle_name, phone, address, passport, speciality, experience, previous_workplace, previous_position, previous_wage
        @last_name = last_name
        @name = name
        @middle_name = middle_name
        @phone = phone
        @address = address
        @passport = passport
        @speciality = speciality
        @experience = experience
        @previous_workplace = previous_workplace
        @previous_position = previous_position
        @previous_wage = previous_wage
    end

    public 
    def ShowInfo
        puts "Фамилия Имя Отчество: #{@last_name} #{@name} #{@middle_name}"
        puts "Телефон: #{@phone}"
        puts "Адрес: #{@address}"
        puts "Пасрорт: #{@passport}"
        puts "Специальность: #{@speciality}"
        puts "Стаж: #{@experience}"
        if @experience != 0 then
            puts "Предыдущее место работы: #{@previous_workplace}"
            puts "Должность на предыдущем месте работы: #{@previous_position}"
            puts "Зароботная плата на предыдущем месте работы: #{@previous_wage}"
        end
    end
end