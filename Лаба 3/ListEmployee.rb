require "json"
require 'openssl'
require 'base64'

require_relative "Employee"

class ListEmployee
    def initialize(array = [])
        @List = array
    end

    def self.from_hash(hash)
        employees = ListEmployee.new
        hash.each { |emp|
            unless emp["experience"] == 0
                employees.add Employee.new emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], emp["passport"], emp["speciality"], emp["experience"], emp["previous_workplace"], emp["previous_position"], emp["previous_wage"]
            else
                employees.add Employee.employee_without_experience emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], emp["passport"], emp["speciality"]
            end
        }
        employees
    end

    def to_hash
        hash = {}
        hash["employees"] = []
        @List.each { |emp|

            emp_hash = {}
            emp_hash["fullname"] = emp.fullname
            emp_hash["birthdate"] = emp.birthdate
            emp_hash["phone"] = emp.phone
            emp_hash["address"] = emp.address
            emp_hash["email"] = emp.email
            emp_hash["passport"] = emp.passport
            emp_hash["speciality"] = emp.speciality
            emp_hash["experience"] = emp.experience
            
            unless emp.experience == 0 then
                emp_hash["previous_workplace"] = emp.previous_workplace
                emp_hash["previous_position"] = emp.previous_position
                emp_hash["previous_wage"] = emp.previous_wage
            end

            hash["employees"].push(emp_hash)
        }
        hash
    end

    def encrypt(public_key_filename, emloyees)
        public_key = OpenSSL::PKey::RSA.new File.read 'public_key.pem'

        employees.map { |employee|
        encrypted_passport = Base64.encode64(public_key.public_encrypt(emp.passport))
        employee.passport = encrypted_passport
        }
    end

    def decrypt(private_key_filename, emloyees)
        private_key = OpenSSL::PKey::RSA.new File.read 'private_key.pem'

        employees.map { |employee|
        decrypted_passport = private_key.private_decrypt(Base64.decode64(employee.passport))
        employee.passport = decrypted_passport
        }
    end

    def self.read_list_DB(client)
        select_employees_query = "SELECT * FROM employees;"
        result = client.query(select_employees_query)
        ListEmployee.from_hash(result)
    end

    def self.from_json(json_file)
        hash = (JSON.load(File.new(json_file)))["employees"]
        Employee.from_hash(hash)
    end

    def to_json(json_file)
        hash = @List.to_hash
        JSON.dump(hash, File.new(json_file, "w"))
    end

    def add(employee)
        @List.push(employee)
    end

    def delete(employee)
        @List.pop(employee)
    end

    def get
        @List
    end

    def search_by_fullname(fullname)
        @List.filter { |emp| emp.fullname == fullname }[0]
    end

    def search_by_email(email)
        @List.filter { |emp| emp.email == email }[0]
    end

    def search_by_phone(phone)
        @List.filter { |emp| emp.phone == phone }[0]
    end

    def search_by_passport(passport)
        @List.filter { |emp| emp.passport == passport }[0]
    end

    def sort_by_fullname!
        @List.sort! { |emp1, emp2| emp1.fullname <=> emp2.fullname }
    end

    def sort_by_birthdate!
        @List.sort! { |emp1, emp2| emp1.birthdate <=> emp2.birthdate }
    end

    def sort_by_phone!
        @List.sort! { |emp1, emp2| emp1.phone <=> emp2.phone }
    end

    def sort_by_address!
        @List.sort! { |emp1, emp2| emp1.address <=> emp2.address }
    end

    def sort_by_email!
        @List.sort! { |emp1, emp2| emp1.email <=> emp2.email }
    end

    def sort_by_passport!
        @List.sort! { |emp1, emp2| emp1.passport <=> emp2.passport }
    end

    def sort_by_speciality!
        @List.sort! { |emp1, emp2| emp1.speciality <=> emp2.speciality }
    end

    def sort_by_experience!
        @List.sort! { |emp1, emp2| emp1.experience <=> emp2.experience }
    end

    def sort_by_previous_workplace!
        @List.sort! { |emp1, emp2| emp1.fullname <=> emp2.fullname }
    end

    def sort_by_previous_position!
        @List.sort! { |emp1, emp2| emp1.previous_position <=> emp2.previous_position }
    end

    def sort_by_previous_wage!
        @List.sort! { |emp1, emp2| emp1.previous_wage <=> emp2.previous_wage }
    end
end