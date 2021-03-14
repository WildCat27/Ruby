#coding: utf-8

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

    def self.Phone? string
        string =~ /^(8|\+7)[\- ?]?(\(?\d{3}\)?[\-]?)?[\d\- ]{7,10}$/
    end

    def self.CorrectPhone string
        if Phone? string
            return "#{string[0]}-#{string[1..3]}-#{string[4..9]}"
        else
            raise "Некорректный номер телефона"
        end
    end

    def self.EMail? string
        string =~ /^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$/
    end

    def self.CorrectEmail string
        if Email? string
            return string.lower
        else
            raise "Некорректный адрес электронной почты"
        end
    end

    def self.FullName? string
        string =~ /\s*[a-zа-я]+(\-[a-zа-я]+)?\s+[a-zа-я]+(\-[a-zа-я]+)?\s+[a-zа-я]+([a-zа-я]+)?\s*/i
    end

    def self.CorrectFullName string
        if FullName? string
            string = (string.strip.squeeze " ").downcase
            string.gsub!(/\s+\-\s+/, "-")
            string.gsub!(/[^\s\-]([a-zа-я]+)[\s\-$]/) { |str| str.capitalize }
            if string.split[3]
                string.gsub!(/\s([a-zа-я]+)$/) { |str| str.downcase }
            end
            return string
        else
            raise "Некорректные ФИО"
        end
    end
end