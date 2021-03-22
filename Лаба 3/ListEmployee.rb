require "json"
require 'openssl'
require 'base64'

require_relative "Employee"

class ListEmployee
    def initialize
        @List = Array.new
    end

    def self.FromJson json_file
        employees = (JSON.load(File.new(json_file)))["employees"]
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

    def ToJson json_file
        file = File.open("\.ssh\\public.pem", "rb:UTF-16LE")
        key = file.read.force_encoding("UTF-16LE").encode("utf-8", replace: nil).gsub("\\n", "\n")
        file.close
        public_key = OpenSSL::PKey::RSA.new("-----BEGIN RSA PUBLIC KEY-----\nMIIBCgKCAQEAwCikh1MhXaqJd4WhQADJlw2wv5aaQlfkdNMaP9EHQYkBifTl7cES\nogazKrQXb+Q50FfVGuwnUBwXX0qneeECWVHmzQazuRA9aOQ0+KgNImmqr3mF9Te1\nz75JlEVXR6/XTjJ74DjeTfKO/Ay9X6EjUKJdoDGTVAOXZ3UkdZeIzsvHyoYz5cd/\nOyidmVuLMZKIoHFCpAhpR2s8IKsXz1OfhxYT1BYDadUxG0HYittYRlVaFP4BAfOV\nHMuP1fZAl3Kltb6gNATV+KeC8yRFG0Pm4CgSK0oEhn/Gr7yLbDUrIJblg9aV59tk\nHZYuphar5Mhdt+3lX9mAlXMtEEf4sRyvAQIDAQAB\n-----END RSA PUBLIC KEY-----\n")

        hash = {}
        hash["employees"] = []
        @List.each { |emp|
            emp_hash = {}
            emp_hash["fullname"] = emp.FullName
            emp_hash["birthdate"] = emp.Birthdate
            emp_hash["phone"] = emp.Phone
            emp_hash["address"] = emp.Address
            emp_hash["email"] = emp.EMail
            emp_hash["passport"] = Base64.encode64(public_key.public_encrypt(emp.Passport))
            emp_hash["speciality"] = emp.Speciality
            emp_hash["experience"] = emp.Experience
            
            unless emp.Experience == 0 then
                emp_hash["previous_workplace"] = emp.PreviousWorkplace
                emp_hash["previous_position"] = emp.PreviousPosition
                emp_hash["previous_wage"] = emp.PreviousWage
            end

            hash["employees"].push(emp_hash)
        }
        JSON.dump(hash, File.new(json_file, "w"))
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