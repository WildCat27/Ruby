#coding: utf-8
require_relative "../SingleControllers/Validator"
require_relative "../SingleControllers/Encrypter"


class Employee
    attr_reader :fullname, :birthdate, :phone, :address, :email, :passport, :speciality, :experience, :previous_workplace, :previous_position, :previous_wage

    
    def self.employee_without_experience fullname, birthdate, phone, address, email, passport, speciality
        Employee.new fullname, birthdate, phone, address, email, passport, speciality, 0, nil, nil, nil
    end

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

    def fullname= fullname
        @fullname = Validator.validate_fullname fullname
    end

    def birthdate= birthdate
        @birthdate = Validator.validate_birthdate birthdate
    end

    def phone= phone
        @phone = Validator.validate_phone phone
    end

    def address= address
        @address = address
    end

    def email= email
        @email = Validator.validate_email email
    end

    def passport= passport
        @passport = Validator.validate_passport passport
    end

    def speciality= speciality
        @speciality = speciality
    end

    def experience= experience
        @experience = experience
    end

    def previous_workplace= previous_workplace
        @previous_workplace = previous_workplace
    end

    def previous_position= previous_position
        @previous_position = previous_position
    end

    def previous_wage= previous_wage
        @previous_wage = previous_wage
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
