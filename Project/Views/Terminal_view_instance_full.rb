class Terminal_view_instance_full

    def initialize(view_instance, model)
        @view_instance = view_instance
        @view_instance.full(model)
    end
    

    def show
        @view_instance.show_instance
        while true
            puts "1 - Редактировать; 2 - Удалить; 3 - Сохранить; 4 - Отменить."
            item = STDIN.gets.chomp
            case item
            when "1"
                @view_instance.show_edit_menu
                puts "Введите номер параметра для редактирования"
                param = STDIN.gets.chomp
                @view_instance.edit(param)
            when "2"
            when "3"
                return @view_instance.save
            when "4"
                return
            end
        end
    end

end