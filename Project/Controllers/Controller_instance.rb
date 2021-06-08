class Controller_instance
    attr_accessor :view
    def initialize(controller_list)
        @controller_list = controller_list
    end

    def show
        @view.show
    end

    def show_instance
        @view.show_instance
    end

    # for separate class
    def save
    end

    def check
    end

    def cancel
    end
end