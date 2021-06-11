class Controller_list

    def initialize(fabric)
        @fabric = fabric
        @list = fabric.list
        @view_list = fabric.view_list(self)
    end

    def show
        @view_list.show
    end

    def show_list
        @view_list.show_list(@list.get)
    end

    def add_instance(instance)
        @list.add(instance)
        show_list
    end

    def new_instance
        controller_instance = @fabric.controller_instance(self)
        controller_instance.show
    end

    def replace_instance(instance, new_instance)
        @list.replace(instance, new_instance)
        show_list
    end

    def show_instance(index)
        instance = choose_instance(index)
        controller_instance = @fabric.controller_instance_full(self, instance)
        controller_instance.show
    end

    def choose_instance(index)
        @list.choose(index)
    end
    
    def replace(index, new_instance)
        instance = choose_instance(index)
        @list.replace(instance, new_instance)
        show_list
    end

    def delete_instance(index)
        @list.delete(index)
        show_list
    end

    def close_view
    end

    def update_db
        @list.update_db
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