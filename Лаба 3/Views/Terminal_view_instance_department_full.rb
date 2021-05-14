class Terminal_view_department
    def initialize
        @fields = {
            :name= : ""
        }
    end

    def save
        @controller.save(@fields)
    end

    def edit
        puts "Введите название департамента"
        @fields[:name=] = STDIN.gets.chomp
    end
end