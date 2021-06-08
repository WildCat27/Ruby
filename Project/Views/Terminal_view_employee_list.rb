require_relative "Terminal_view_list"
require_relative "Terminal_view_employee"

class Terminal_view_employee_list < Terminal_view_list
    def create_instance_view(controller_instance)
        Terminal_view_employee.new(controller_instance)
    end
end