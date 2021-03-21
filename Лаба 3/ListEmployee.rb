require "json"

require_relative "Employee"

class ListEmployee
    def initialize
        @List = Array.new
    end

    def self.FromJson json_file
        employees = (JSON.load File.new json_file)["employees"]
        list = ListEmployee.new
        employees.each { |emp|
            unless emp["experience"] == 0
                list.Add Employee.new emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], emp["passport"], emp["speciality"], emp["experience"], emp["previous_workplace"], emp["previous_position"], emp["previous_wage"]
            else
                list.Add Employee.EmployeeWithoutExperience emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], emp["passport"], emp["speciality"]
            end
        }
        list
    end

    def Add employee
        @List.push employee
    end

    def Get
        @List
    end

    def SearchByFullname fullname
        List.filter { |emp| emp.FullName == fullname }[0]
    end

    def SearchByEMail email
        List.filter { |emp| emp.EMail == email }[0]
    end

    def SearchByPhone phone
        List.filter { |emp| emp.Phone == phone }[0]
    end

    def SearchByPassport passport
        List.filter { |emp| emp.FullName == passport }[0]
    end

    def GetTextReport
        List.filter { |emp| emp.FullName == fullname }[0]
    end
end