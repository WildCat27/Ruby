require "json"
require "psych"
require "rexml/document"

require_relative "../SingleControllers/DBController"
require_relative "Employee"
require_relative "List"

class Employee_list
    def initialize(array = [])
        @List = array
    end
    
    def update_db
        DBController.controller.execute("DELETE FROM employees;")
        @List.each do |employee|
            DBController.controller.execute(
                "INSERT INTO employees (fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
                *(employee.to_encrypted_hash.values))
        end
    end

    def from_json(json_file)
        hash_employees = (JSON.load(File.new(json_file)))["employees"]
        from_encrypted_hash(hash_employees)
    end

    def to_json(json_file)
        hash_employees = to_encrypted_hash
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

    def self.from_xml(xml_file)
    end

    def to_xml(xml_file)

    end

    def self.from_yaml(yaml_file)
        @List = Psych.parse_file(yaml_file).to_ruby
    end

    def add(employee)
        DBController.controller.execute(
            "INSERT INTO employees (fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
            *(employee.to_encrypted_hash.values))
        @List.push(employee)
    end

    def replace(emp1, emp2)
        DBController.controller.execute(
            "UPDATE employees SET fullname = ?, birthdate = ?, phone = ?, address = ?, email = ?, passport = ?, speciality = ?, experience = ?, previous_workplace = ?, previous_position = ?, previous_wage = ? WHERE employee_id = (SELECT employee_id FROM employees WHERE fullname = ? AND birthdate = ? AND phone = ? AND address = ? AND email = ? AND speciality = ? AND experience = ? AND previous_workplace = ? AND previous_position = ? AND previous_wage = ?);",
            *(emp2.to_encrypted_hash.values),
            emp1.fullname,
            emp1.birthdate,
            emp1.phone,
            emp1.address,
            emp1.email,
            emp1.speciality,
            emp1.experience,
            emp1.previous_workplace,
            emp1.previous_position,
            emp1.previous_wage
        )
        
        emp1.fullname = emp2.fullname
        emp1.birthdate = emp2.birthdate
        emp1.phone = emp2.phone
        emp1.address = emp2.address
        emp1.email = emp2.email
        emp1.passport = emp2.passport
        emp1.speciality = emp2.speciality
        emp1.experience = emp2.experience
        emp1.previous_workplace = emp2.previous_workplace
        emp1.previous_position = emp2.previous_position
        emp1.previous_wage = emp2.previous_wage
    end

    def delete(index)
        employee = choose(index)
        DBController.controller.execute(
            "DELETE FROM employees WHERE phone = ?;",
            employee.phone)
        @List.pop(index)
        puts @List
    end

    def choose(index)
        @List[index]
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

    def write_to_db
        hash = to_encrypted_hash
        hash.each do |emp|
                DBController.controller.execute(
                    "INSERT INTO employees (fullname, birthdate, phone, address, email, passport, speciality, experience, previous_workplace, previous_position, previous_wage) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
                    emp.values)

        end
    end

    def read_from_db
        hash = DBController.controller.execute("SELECT * FROM employees;")
        from_encrypted_hash(hash)
    end
    
    def from_encrypted_hash(hash)
        hash.each do |emp_hash|
            @List.append(Employee.from_encrypted_hash(emp_hash))
        end
    end
    
    def to_encrypted_hash
        hash = []
        @List.each { |emp|
            hash.push(emp.to_encrypted_hash)
        }
        hash
    end
end