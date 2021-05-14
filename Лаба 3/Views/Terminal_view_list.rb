class Terminal_view_list
    def initialize(controller)
        @controller = controller
    end

    def show
        
    end

    def show_list(list)
        list.each do |item|
            puts(item.to_s)
        end
    end

    def choose()
        puts "Enter index"
        index = STDIN.gets.chomp
        @controller.choose_instance(index)
    end

    def close
    end
    
end