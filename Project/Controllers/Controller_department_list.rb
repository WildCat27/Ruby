require_relative "Controller_list"


class Controller_department_list < Controller_list
    
    def self.fabric
        controller = new(DepartmentList.new)
        controller.view_list = Terminal_view_department_list.new(controller)
        controller
    end

    
    def add_instance
        if department = Controller_department.new(self).show
            @list.add(department)
        end
    end

    def show_instance
        Controller_department.new(self, @selected).show
    end

end