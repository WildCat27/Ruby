require_relative "../Models/Employee"
require_relative "../SingleControllers/Validator"
require_relative "Controller_instance"

class Controller_employee < Controller_instance

    def save(values)
        emp = Employee.new(*values)
        @save_strategy.save(emp)
    end

    def check(param, value)
        begin
            Validator.validate_fullname(value) if param == "fullname"
            Validator.validate_birthdate(value) if param == "birthdate"
            Validator.validate_phone(value) if param == "phone"
            #fields["address"]
            Validator.validate_email(value) if param == "email"
            Validator.validate_passport(value) if param == "passport"
            #@model.speciality = fields["speciality"]
            #@model.experience = fields["experience"]
            true
        rescue => exception
            @save_strategy.view.show_message(exception.message)
        end
    end
end