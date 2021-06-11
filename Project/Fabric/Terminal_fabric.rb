require_relative "View_fabric"

class Terminal_fabric < View_fabric

    def initialize
        super
    end

    def view_list(controller_list)
        fabric.terminal_view_list(controller_list)
    end

    def view_instance(controller_instance)
        fabric.terminal_view_instance(controller_instance)
    end

    def view_instance_full(view_instance, instance)
        fabric.terminal_view_instance_full(view_instance, instance)
    end

end