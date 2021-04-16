require "json"
require "psych"
require 'openssl'
require 'base64'

require_relative "Employee"

class ListEmployee
    def initialize(array = [])
        @List = array
    end
    
    def self.from_encrypted_hash(hash_employees, private_key_filename)
        private_key = OpenSSL::PKey::RSA.new File.read(private_key_filename)

        employees = ListEmployee.new
        hash_employees.each { |emp|
            decrypted_passport = private_key.private_decrypt(Base64.decode64(emp["passport"]))

            unless emp["experience"] == 0
                employees.add Employee.new emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], decrypted_passport, emp["speciality"], emp["experience"], emp["previous_workplace"], emp["previous_position"], emp["previous_wage"]
            else
                employees.add Employee.employee_without_experience emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], decrypted_passport, emp["speciality"]
            end
        }
        employees
    end

    def to_encrypted_hash(public_key_filename)
        public_key = OpenSSL::PKey::RSA.new File.read(public_key_filename)

        hash_employees = []
        @List.each { |emp|
            encrypted_passport = Base64.encode64(public_key.public_encrypt(emp.passport))

            emp_hash = {}
            emp_hash["fullname"] = emp.fullname
            emp_hash["birthdate"] = emp.birthdate
            emp_hash["phone"] = emp.phone
            emp_hash["address"] = emp.address
            emp_hash["email"] = emp.email
            emp_hash["passport"] = encrypted_passport
            emp_hash["speciality"] = emp.speciality
            emp_hash["experience"] = emp.experience
            
            unless emp.experience == 0 then
                emp_hash["previous_workplace"] = emp.previous_workplace
                emp_hash["previous_position"] = emp.previous_position
                emp_hash["previous_wage"] = emp.previous_wage
            end

            hash_employees.push(emp_hash)
        }
        hash
    end

    def self.from_json(json_file, private_key_filename)
        hash_employees = (JSON.load(File.new(json_file)))["employees"]
        ListEmployee.from_encrypted_hash(hash_employees, private_key_filename)
    end

    def to_json(json_file, public_key_filename)
        hash_employees = to_encrypted_hash(public_key_filename)
        JSON.dump({ "employees": hash_employees }, File.new(json_file, "w"))
    end

    def self.from_yaml(yaml_file)
        @List = YAML::load(File.open(yaml_file))
    end

    def to_yaml(yaml_file)
        File.open(yaml_file, 'w') do |file|
            file.write(Psych.dump(@List))
        end
    end

    def self.from_yaml(yaml_file)
        @List = Psych.parse_file(yaml_file).to_ruby
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

    def search_by(param, value)
        @List.filter { |emp|
            emp.method(param).call == value
        }[0]
    end

    def sort_by(*params)
        @List.sort { |emp1, emp2|
            comparison = 0
            params.each { |param|
                break if (comparison = 
                    emp1.method(param).call <=> emp2.method(param).call
                    ) != 0
            }
            comparison
        }
    end
end