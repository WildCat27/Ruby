require_relative "Terminal_view_instance"

class Terminal_view_instance_full < Terminal_view_instance
    def show
        item = STDIN.gets.chomp
        case item
        when 1
            edit
        when 2
            delete
        end
    end

    def save
        @controller.save(fields)
    end

    def edit
    end

    def delete
        puts("Удалить? [Да/Нет]")
        answer = STDIN.gets.chomp.downcase
        @controller.delete if answer == "да"
    end
end