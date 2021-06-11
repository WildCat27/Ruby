require_relative "Fabric"
require_relative "../Models/Employee"
require_relative "../Models/Employee_list"
require_relative "../Views/Window_view_employee_list"
require_relative "../Controllers/New_instance"
require_relative "../Controllers/Show_instance"
require_relative "../Controllers/Controller_employee"
require_relative "../Views/Terminal_view_employee"

class Employee_fabric < Fabric

    def list
        employee_list = Employee_list.new
        employee_list.from_json("emp.json")
        employee_list.update_db
        #employee_list.read_from_db
        employee_list
    end

    def controller_instance
        Controller_employee.new
    end

    def controller_instance(controller_list)
        controller_instance = Controller_employee.new
        save_strategy = New_instance.new(controller_list)
        save_strategy.view = @@fabric.view_instance(controller_instance)
        controller_instance.save_strategy = save_strategy
    end

    def controller_instance_full(controller_list, instance)
        controller_instance = Controller_employee.new
        save_strategy = Show_instance.new(controller_list, instance)
        save_strategy.view = @@fabric.view_instance(controller_instance)
        controller_instance.save_strategy = save_strategy
    end

    def terminal_view_instance(controller_instance)
        Terminal_view_employee.new(controller_instance)
    end


    def window_view_list(app, controller_list)
        Window_view_employee_list.new(app, controller_list)
    end

    def window_view_instance(app, controller_instance)
        Window_view_employee.new(app, controller_instance)
    end

end