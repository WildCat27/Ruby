require_relative "Terminal_view_instance"

class Terminal_view_employee < Terminal_view_instance

    def full(model)
        @fields["fullname"] = model.fullname
        @fields["birthdate"] = model.birthdate
        @fields["phone"] = model.phone
        @fields["address"] = model.address
        @fields["email"] = model.email
        @fields["passport"] = model.passport
        @fields["speciality"] = model.speciality
        @fields["experience"] = model.experience
        if model.experience
            @fields["previous_workplace"] = model.previous_workplace
            @fields["previous_position"] = model.previous_position
            @fields["previous_wage"] = model.previous_wage
        end
    end

    
    def edit(param)
        if param == "1" || param == "all"
            puts "Фамилия Имя Отчество:"
            enter_value("fullname")
        end
        if param == "2" || param == "all"
            puts "Дата рождения:"
            enter_value("birthdate")
        end
        if param == "3" || param == "all"
            puts "Телефон:"
            enter_value("phone") 
        end
        if param == "4" || param == "all"
            puts "Адрес:"
            enter_value("address") 
        end
        if param == "5" || param == "all"
            puts "Электронная почта:"
            enter_value("email") 
        end
        if param == "6" || param == "all"
            puts "Серия и номер пасспорта:"
            enter_value("passport") 
        end
        if param == "7" || param == "all"
            puts "Специальность:"
            enter_value("speciality")
        end
        if param == "8" || param == "all"
            puts "Опыт работы:"
            enter_value("experience") 
        end
        if @fields["experience"]
            if param == "9" || param == "all"
                puts "Предыдущее место работы:"
                enter_value("previous_workplace") 
            end
            if param == "10" || param == "all"
                puts "Предыдущая должность:"
                enter_value("previous_position") 
            end
            if param == "11" || param == "all"
                puts "Зарплата на предыдущем месте работы:"
                enter_value("previous_wage") 
            end
        end
    end


    def show_edit_menu
        puts "1 - Фамилия Имя Отчество"
        puts "2 - Дата рождения"
        puts "3 - Телефон"
        puts "4 - Адрес"
        puts "5 - Электронная почта"
        puts "6 - Серия и номер паспорта"
        puts "7 - Специальность"
        puts "8 - Опыт работы"
        if @fields["experience"]
            puts "9 - Предыдущее место работы"
            puts "10 - Предыдущая должность"
            puts "11 - Зарплата на предыдущем месте работы"
        end
    end


    def show_instance
        puts "Фамилия Имя Отчество: #{@fields["fullname"]}"
        puts "Дата рождения: #{@fields["birtdate"]}"
        puts "Телефон: #{@fields["phone"]}"
        puts "Адрес: #{@fields["address"]}"
        puts "Электронная почта: #{@fields["email"]}"
        puts "Серия и номер пасспорта: #{@fields["passport"]}"
        puts "Специальность: #{@fields["speciality"]}"
        puts "Опыт работы: #{@fields["experience"]}"
        if @fields["experience"]
            puts "Предыдущее место работы: #{@fields["previous_workplace"]}"
            puts "Предыдущая должность: #{@fields["previous_position"]}"
            puts "Зарплата на предыдущем месте работы: #{@fields["previous_wage"]}"
        end
    end
end