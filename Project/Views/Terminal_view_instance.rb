class Terminal_view_instance
    def initialize(controller_instance)
        @controller_instance = controller_instance
        @fields = Hash.new
    end

    def show
        edit("all")
        while true
            puts "1 - Сохранить; 2 - Редактировать; 3 - Отменить."
            item = STDIN.gets.chomp
            case item
            when "1"
                return save
            when "2"
                show_edit_menu
                puts "Введите номер параметра для редактирования"
                param = STDIN.gets.chomp
                edit(param)
            when "3"
                return
            end
        end
    end


    def save
        @controller_instance.save(@fields.values)
    end

    def show_message(message)
        puts "!!! #{message}"
    end


    def show_edit_menu
    end
    

    def enter_value(param)
        puts "Текущее значение: #{@fields[param]}" if @fields[param]
        value = STDIN.gets.chomp
        while !@controller_instance.check(param, value)
            value = STDIN.gets.chomp
            return if value == "#cancel"
        end
        @fields[param] = value
    end
end