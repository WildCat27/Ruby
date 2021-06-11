#coding: utf-8
require_relative "../SingleControllers/Validator"
require_relative "../SingleControllers/Encrypter"


class Employee
    
    attr_reader :fullname, :birthdate, :phone, :address, :email, :passport, :speciality, :experience, :previous_workplace, :previous_position, :previous_wage

    
#   Вызывает конструктор класса Employee для сотрудника без опыта работы
#   @see initialize
    def self.employee_without_experience(fullname, birthdate, phone, address, email, passport, speciality)
        Employee.new(fullname, birthdate, phone, address, email, passport, speciality, 0, nil, nil, nil)
    end


#   Создает объект класса Employee из хеша
#   @note Паспорт зашифрован
    def self.from_encrypted_hash(hash)
        decrypted_passport = Encrypter.controller.decrypt(hash["passport"])
        Employee.new(hash["fullname"],
            hash["birthdate"], 
            hash["phone"], 
            hash["address"], 
            hash["email"], 
            decrypted_passport, 
            hash["speciality"], 
            hash["experience"], 
            hash["previous_workplace"], 
            hash["previous_position"], 
            hash["previous_wage"]
            )
    end

#   @!attribute
#   Устанавливает ФИО
#   @param fullname [String]
    def fullname=(fullname)
        @fullname = Validator.validate_fullname fullname
    end

#   Устанавливает дату рождения
#   @param birthdate [String] только Date или String
#   @note Принимает строку в формате "%Y-%m-%d" или "%Y-%m-%d"
    def birthdate=(birthdate)
        @birthdate = Validator.validate_birthdate birthdate
    end

#   Устанавливает номер телефона
#   @param phone [String]
#   @note Распознает российские номера с пробелами и тире
    def phone=(phone)
        @phone = Validator.validate_phone phone
    end

#   Устанавливает адрес
#   @param address [String]
    def address=(address)
        @address = address
    end


#   Устанавливает электронную почту
#   @param email [String]
    def email=(email)
        @email = Validator.validate_email email
    end


#   Устанавливает номер и серию паспорта
#   @param passport [String]
#   @note Допустимо использование пробела или тире
    def passport=(passport)
        @passport = Validator.validate_passport passport
    end


#   Устанавливает специальность
#   @param speciality [String]
    def speciality=(speciality)
        @speciality = speciality
    end


#   Устанавливает опыт работы
#   @param experience [String]
    def experience=(experience)
        @experience = experience
    end

#   Устанавливает предыдущее место работы
#   @param previous_workplace [String]
    def previous_workplace=(previous_workplace)
        @previous_workplace = previous_workplace
    end


#   Устанавливает должность на предыдущем месте работы
#   @param previous_position [String]
    def previous_position=(previous_position)
        @previous_position = previous_position
    end


#   Устанавливает зарплату на предыдущем местре работы
#   @param previous_wage [Numeric]
    def previous_wage=(previous_wage)
        @previous_wage = previous_wage
    end


#   Устанавливает дату рождения
#   @param fullname [String] Фамилия Имя Отчество
#   @param birthdate [Date, String] Дата рождения (принимает строку в формате "%Y-%m-%d" или "%Y-%m-%d")
#   @param phone [String] Российский номер телефона (допустимы пробелы и тире)
#   @param address [String] Адрес проживания
#   @param email [String] Электронная почта
#   @param passport [String] Серия и номер паспорта (допустимы пробелы и тире)
#   @param speciality [String] Наименование специальности
#   @param experience [String] Опыт работы
#   @param previous_workplace [String] Предыдущее место работы
#   @param previous_position [String] Должность на предыдущем месте работы
#   @param previous_wage [Numeric] Зарплата на предыдущем месте работы
#   @return [Employee] Работник
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
        @fullname
    end

    def to_encrypted_hash
        emp_hash = {}
        encrypted_passport = Encrypter.controller.encrypt(self.passport)

        emp_hash["fullname"] = self.fullname
        emp_hash["birthdate"] = self.birthdate
        emp_hash["phone"] = self.phone
        emp_hash["address"] = self.address
        emp_hash["email"] = self.email
        emp_hash["passport"] = encrypted_passport
        emp_hash["speciality"] = self.speciality
        emp_hash["experience"] = self.experience
        emp_hash["previous_workplace"] = self.previous_workplace
        emp_hash["previous_position"] = self.previous_position
        emp_hash["previous_wage"] = self.previous_wage
        emp_hash
    end

    def ==(emp)
        @fullname == emp.fullname && @birthdate == emp.birthdate && @phone == emp.phone && @address == emp.address && @email == emp.email && @passport == emp.passport && @speciality == emp.speciality && @experience == emp.experience && @previous_workplace == emp.previous_workplace && @previous_position == emp.previous_position && @previous_wage == emp.previous_wage
    end
end
