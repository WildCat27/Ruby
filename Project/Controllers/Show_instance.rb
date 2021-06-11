class Show_instance
    attr_accessor :view

    def initialize(controller_list, instance)
        @controller_list = controller_list
        @instance = instance
    end

    def show
        @view.show_instance(@instance)
        @view.show_view
    end

    def save(new_instance)
        @controller_list.replace_instance(@instance, new_instance)
    end
end