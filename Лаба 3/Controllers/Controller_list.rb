require_relative "Controller_instance_full"

class Controller_list
    private_class_method :new
    attr_writer :view_list

    def initialize(list)
        @list = list
    end

    def self.fabric(list)
        new(list)
    end

    def show_view
    end

    def show_list
        @view_list.show_list(@list.list)
    end

    def choose_instance(index)
        Controller_instance_full(@list.choose(index))
    end

    def add_instance(instance)
        @list.add(instance)
    end

    def show_instance()
    end

    def delete_instance()
    end

    def close_view
    end
end