class Controller_list
    private_class_method :new
    attr_accessor :view_list

    def initialize(list)
        @list = list
    end

    def self.fabric_terminal(list)
        new(list)
    end

    def read_from_db
        @list.read_from_db
    end

    def show_view
        @view_list.show(@selected)
    end

    def show_list
        @view_list.show_list(@list.get)
        #show_view
    end

    def choose_instance(index)
        @selected = @list.choose(index)
    end
    
    def replace(new_instance)
        @list.replace(@selected, new_instance)
    end

    def delete_instance
        @list.delete[@selected]
    end

    def close_view
    end

    def read_from_db
        @list.read_from_db
    end

    def write_to_db
        @list.write_to_db
    end

    def from_json(json_file)
        @list.from_json(json_file)
    end

    def to_json(json_file)
        @list.to_json(json_file)
    end
end