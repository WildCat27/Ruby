#coding: utf-8

require "date"

class Employee

    def self.Phone? string
        string =~ /^((7|8|\+7)[\-\s]?)?(\(?\d{3}\)?[\-\s]?)?[\d\-\s]{7,10}$/
    end

    def self.ValidatePhone string
        if Phone? string
            string.gsub!(/\D/, "")
            puts(string)
            return "#{string[0]}-#{string[1..3]}-#{string[4..9]}"
        else
            raise "Некорректный номер телефона"
        end
    end

    def self.EMail? string
        string =~ /^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$/
    end

    def self.ValidateEmail string
        if EMail? string
            return string.downcase
        else
            raise "Некорректный адрес электронной почты"
        end
    end

    def self.FullName? string
        # —
        string =~ /\s*[a-zа-яё]+(\-[a-zа-яё]+)?\s+[a-zа-яё]+(\-[a-zа-яё]+)?\s+[a-zа-яё]+([a-zа-яё]+)?\s*/i
    end

    def self.ValidateFullName string
        if FullName? string
            string = (string.strip.squeeze(" ")).downcase
            string.strip!
            string.gsub!(/\s?\-\s?/, "-")
            string.gsub!(/[\s\-]?([a-zа-яё]+)[\s\-]?/) { |str| str.capitalize }
            fullname = string.split
            if fullname[3]
                fullname[3].downcase!
            end
            return fullname.join(" ")
        else
            raise "Некорректные ФИО"
        end
    end


    def self.StringToDate string
        date = (string.split ".").map { |num| Integer(num)}
        date[2] += 2000 if date[2] < 100
        Date.new date[2], date[1], date[0] if Date.valid_date? date[2], date[1], date[0]
    end


    def self.BirthDate? string
        string =~ /\d?\d\.\d\d\.\d\d(\d\d)?/ && (self.StringToDate string)
    end

    def self.ValidateBirthDate string
        begin
            Date.strptime(string, "%d.%m.%Y").strftime("%d.%m.%Y")
        rescue
            raise "Некорректная дата рождения"
        end
    end

    def self.Passport? string
        string =~ /\s-\d{4}[\-\.\s*]\d{6}\s*/
    end

    def self.ValidatePassport string
        string.gsub!(/\D/, "")
        string[0..3] + " " + string[4..-1]
    end

    
    def self.EmployeeWithoutExperience fullname, birthdate, phone, address, email, passport, speciality
        Employee.new fullname, birthdate, phone, address, email, passport, speciality, 0, nil, nil, nil
    end

    def Fullname= fullname
        @fullname = Employee.ValidateFullName fullname
    end

    def FullName
        @fullname
    end

    def Birthdate= birthdate
        @birthdate = Employee.ValidateBirthDate birthdate
    end

    def Birthdate
        @birthdate
    end

    def Phone= phone
        @phone = Employee.ValidatePhone phone
    end

    def Phone
        @phone
    end

    def Address= address
        @address = address
    end

    def Address
        @address
    end

    def EMail= email
        @email = Employee.ValidateEmail email
    end

    def EMail
        @email
    end

    def Passport= passport
        @passport = Employee.ValidatePassport passport
    end

    def Passport
        @passport
    end

    def Speciality= speciality
        @speciality = speciality
    end

    def Speciality
        @speciality
    end

    def Experience= experience
        @experience = experience
    end

    def Experience
        @experience
    end

    def PreviousWorkplace= previous_workplace
        @previous_workplace = previous_workplace
    end

    def PreviousWorkplace
        @previous_workplace
    end

    def PreviousPosition= previous_position
        @previous_position = previous_position
    end

    def PreviousPosition
        @previous_position
    end

    def PreviousWage= previous_wage
        @previous_wage = previous_wage
    end

    def PreviousWage
        @previous_wage
    end

    def initialize fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage
        self.Fullname = fullname
        self.Birthdate = birthdate
        self.Phone = phone
        self.Address = address
        self.EMail = email
        self.Passport = passport
        self.Speciality = speciality
        self.Experience = experience
        self.PreviousWorkplace = previous_workplace
        self.PreviousPosition = previous_position
        self.PreviousWage = previous_wage
    end

    def ShowInfo
        puts "Фамилия Имя Отчество: #{@fullname}"
        puts "Дата рождения: #{@birthdate}"
        puts "Телефон: #{@phone}"
        puts "Адрес: #{@address}"
        puts "Электронная почта: #{@email}"
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
