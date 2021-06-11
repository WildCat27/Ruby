class Terminal_view_list

    def initialize(controller_list)
        @controller_list = controller_list
        @selected_index = 0
        @selected_item = @controller_list.choose_instance(0)
    end

    def show
        while true
            puts "1 - Показать список;"
            puts "2 - Добавить новый элемент;"
            puts "3 - Выбрать элемент;"
            puts "4 - Показать выбранный;"
            puts "5 - Удалить выбранный;"
            puts "6 - Закрыть."
            puts "#selected #{@selected_item}"
            input = STDIN.gets.chomp
            case input
            when "1"
                @controller_list.show_list
            when "2"
                @controller_list.add_instance
            when "3"
                puts "Введите номер элемента:"
                @selected_index = Integer(STDIN.gets.chomp)
                @selected_item = @controller_list.choose_instance(@selected_index)
            when "4"
                @controller_list.show_instance(@selected_index)
            when "5"
                @controller_list.delete_instance(@selected_index)
            when "6"
                break
            end
        end
    end

    
    def show_list(list)
        list.each do |item|
            puts(item.to_s)
        end
    end

    def show_instance
        @controller.show_instance
    end

    def delete
        @controller.delete
    end
end