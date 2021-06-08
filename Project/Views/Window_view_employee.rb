require_relative "Window_view_instance"

class Window_view_employee < Window_view_instance
    def initialize(controller_instance)
        super
        @fullname_field = FXTextField.new(self, 30)
        @birthdate_filed = FXTextField.new(self, 30)
        @phone_field = FXTextField.new(self, 30)
        @address_field = FXTextField.new(self, 30)
        @email_field = FXTextField.new(self, 30)
        @password_field = FXTextField.new(self, 30)
        @speciality_field = FXTextField.new(self, 30)
        @experience_field = FXTextField.new(self, 30)
        @previous_workplace_field = FXTextField.new(self, 30)
        @previous_position_field = FXTextField.new(self, 30)
        @previous_wage_field = FXTextField.new(self, 30)
    end
end