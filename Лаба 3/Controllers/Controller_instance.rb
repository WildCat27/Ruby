class Controller_instance
    def initialize(list)
        @list = list
    end

    def show
        @view = Terminal_view_instance()
        @view.show
    end

    def save(values)
    end

    def check
    end

    def cancel
    end
end