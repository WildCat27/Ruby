require_relative "Controller_list"


class Controller_department_list < Controller_list

    
    
    def self.fabric
        controller = new(DepartmentList.new())
        controller.view_list = Terminal_view_department_list.new(controller)
        controller
    end

    def show_view
        
    end

    

    def choose_instance(number)
        
    end
end