require_relative "View_fabric"

class Window_fabric < View_fabric

    def initialize(app)
        @app = app
    end

    def view_list(controller_list)
        fabric.window_view_list(@app, controller_list)
    end

    def view_instance(controller_instance)
        fabric.window_view_instance(@app, controller_instance)
    end

    def view_instance_full(view_instance, instance)
        fabric.window_view_instance_full(view_instance, instance)
    end

end