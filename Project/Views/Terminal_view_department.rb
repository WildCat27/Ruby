class Terminal_view_department < Terminal_view_instance
    
    def full(model)
        @fields["name"] = model.name
    end


    def show_edit_menu
        puts "1 - Название отдела"
    end

    def show_instance(department)
        puts "Название отдела: #{department.name}"
        department.post.each {
            puts pots.to_s
        }
    end


    def edit(params)
        if param == "1" || param == "all"
            puts "Название отдела:"
            enter_value("name")
        end
    end

end