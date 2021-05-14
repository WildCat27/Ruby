#coding: utf-8

require "date"

class Employee

    def self.phone? string
        string =~ /(7|8|\+7)[\-\s]?(\d{3}|(\(\d{3}\)))[\-\s]?\d{2}[\-\s]?\d{2}/
    end

    def self.validate_phone string
        if phone? string
            string.gsub!(/\D/, "")
            return "#{string[0]}-#{string[1..3]}-#{string[4..9]}"
        else
            raise ArgumentError, "Некорректный номер телефона"
        end
    end

    def self.email? string
        string =~ /([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}/
    end

    def self.validate_email string
        if email? string
            return string.downcase
        else
            raise ArgumentError, "Некорректный адрес электронной почты"
        end
    end

    def self.fullname? string
        # —
        string =~ /\s*[a-zа-яё]+(\-[a-zа-яё]+)?\s+[a-zа-яё]+(\-[a-zа-яё]+)?\s+[a-zа-яё]+\s*([a-zа-яё]+)?\s*/i
    end

    def self.validate_fullname string
        if fullname? string
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
            raise ArgumentError, "Некорректные ФИО"
        end
    end


    def self.string_to_date string
        date = (string.split ".").map { |num| Integer(num)}
        date[2] += 2000 if date[2] < 100
        Date.new date[2], date[1], date[0] if Date.valid_date? date[2], date[1], date[0]
    end


    def self.birthdate? string
        string =~ /\d?\d\.\d\d\.\d\d(\d\d)?/ && (self.string_to_date string)
    end

    def self.validate_birthdate string
        begin
            Date.strptime(string, "%d.%m.%Y").strftime("%d.%m.%Y")
        rescue
            raise ArgumentError, "Некорректная дата рождения"
        end
    end

    def self.passport? string
        string =~ /\s*\d{4}[\-\.\s+]?\d{6}\s*/
    end

    def self.validate_passport string
        if passport? string
            string.gsub!(/\D/, "")
            string[0..3] + " " + string[4..-1]
        else
            raise ArgumentError, "Некорректный паспорт"
        end
    end

    
    def self.employee_without_experience fullname, birthdate, phone, address, email, passport, speciality
        Employee.new fullname, birthdate, phone, address, email, passport, speciality, 0, nil, nil, nil
    end

    def fullname= fullname
        @fullname = Employee.validate_fullname fullname
    end

    def fullname
        @fullname
    end

    def birthdate= birthdate
        @birthdate = Employee.validate_birthdate birthdate
    end

    def birthdate
        @birthdate
    end

    def phone= phone
        @phone = Employee.validate_phone phone
    end

    def phone
        @phone
    end

    def address= address
        @address = address
    end

    def address
        @address
    end

    def email= email
        @email = Employee.validate_email email
    end

    def email
        @email
    end

    def passport= passport
        @passport = Employee.validate_passport passport
    end

    def passport
        @passport
    end

    def speciality= speciality
        @speciality = speciality
    end

    def speciality
        @speciality
    end

    def experience= experience
        @experience = experience
    end

    def experience
        @experience
    end

    def previous_workplace= previous_workplace
        @previous_workplace = previous_workplace
    end

    def previous_workplace
        @previous_workplace
    end

    def previous_position= previous_position
        @previous_position = previous_position
    end

    def previous_position
        @previous_position
    end

    def previous_wage= previous_wage
        @previous_wage = previous_wage
    end

    def previous_wage
        @previous_wage
    end

    def initialize fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage
        self.fullname = fullname
        self.birthdate = birthdate
        self.phone = phone
        self.address = address
        self.email = email
        self.passport = passport
        self.speciality = speciality
        self.experience = experience
        self.previous_workplace = previous_workplace
        self.previous_position = previous_position
        self.previous_wage = previous_wage
    end

    def to_s
        str = "Фамилия Имя Отчество: #{@fullname}\nДата рождения: #{@birthdate}\nТелефон: #{@phone}\nАдрес: #{@address}\nЭлектронная почта: #{@email}\nПасрорт: #{@passport}\nСпециальность: #{@speciality}\nСтаж: #{@experience}\n"
        if @experience != 0 then
            str += "Предыдущее место работы: #{@previous_workplace}\nДолжность на предыдущем месте работы: #{@previous_position}\nЗароботная плата на предыдущем месте работы: #{@previous_wage}\n"
        end
        str
    end

    def ==(emp)
        @fullname == emp.fullname && @birthdate == emp.birthdate && @phone == emp.phone && @address == emp.address && @email == emp.email && @passport == emp.passport && @speciality == emp.speciality && @experience == emp.experience && @previous_workplace == emp.previous_workplace && @previous_position == emp.previous_position && @previous_wage == emp.previous_wage
    end
end
