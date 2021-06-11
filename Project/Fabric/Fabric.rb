require_relative "../Controllers/Controller_list"
require_relative "../Views/Terminal_view_list"

class Fabric
    
    private_class_method :new
    
    def self.fabric
        @@fabric ||= new
    end

    def view_fabric=(view_fabric)
        @view_fabric = view_fabric
        @view_fabric.fabric = self
    end

    def controller_list
        Controller_list.new(self)
    end

    def controller_instance(controller_list)
    end

    def controller_instance_full(controller_list, instance)
    end

    def view_list(controller)
        @view_fabric.view_list(controller)
    end

    def view_instance(controller_instance)
        @view_fabric.view_instance(controller_instance)
    end

    def view_instance_full(view_instance, instance)
        @view_fabric.view_instance_full(view_instance, instance)
    end

    def terminal_view_list(controller)
        Terminal_view_list.new(controller)
    end

    def terminal_view_instance(controller_instance)
    end

    def terminal_view_instance_full(terminal_view_instance, instance)
    end

    def window_view_list
    end

    def window_view_instance
    end

    def window_view_instance_full(window_view_instance, instance)
    end
end