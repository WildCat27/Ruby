class New_instance
    attr_accessor :view

    def initialize(controller_list)
        @controller_list = controller_list
    end

    def show
        @view.show_view
    end

    def save(instance)
        @controller_list.add_instance(instance)
    end
end