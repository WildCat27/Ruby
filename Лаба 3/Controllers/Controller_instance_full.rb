require_relative "Controller_instance"
require "require_all"
require_all "Views"

class Controller_instance_full < Controller_instance
    def initialize(controller, model)
        @controller = controller
        @model = model
    end

    def show
        @view = Terminal_view_instance_full()
        @view.show
    end

    def save(params)
        params.each do |name, value|
            @model.method(name).call(value)
        end
    end

    def delete
        @list.delete(@model)
    end
end