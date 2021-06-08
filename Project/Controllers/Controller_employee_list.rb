require_relative "../Models/Employee_list"
require_relative "../Views/Terminal_view_employee_list"
require_relative "../Views/Window_view_employee_list"
require_relative "../Views/Terminal_view_employee"
require_relative "../Views/Terminal_view_instance_full"
require_relative "Controller_employee"
require_relative "Controller_list"


class Controller_employee_list < Controller_list
    
    def self.fabric_terminal
        controller = new(Employee_list.new)
        controller.view_list = Terminal_view_employee_list.new(controller)
        controller
    end

    def self.fabric_window(app)
        controller = new(Employee_list.new)
        controller.view_list = Window_view_employee_list.new(app, controller)
        controller
    end

    def add_instance
        controller = Controller_employee.new(self)
        controller.view = view_list.create_instance_view(controller)
        if employee = controller.show
            @list.add(employee)
        end
        show_view
    end

    def show_instance
        controller = Controller_employee.new(self)
        view = view_list.create_instance_view(controller)
        controller.view = Terminal_view_instance_full.new(view, @selected)
        if employee = controller.show
            @list.replace(@selected, employee)
        end
        show_view
    end

end