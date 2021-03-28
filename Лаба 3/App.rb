require_relative "ListEmployee"
require_relative "TerminalViewListEmployee"

def get_menu
    puts "Меню:\n\t1 - Добавить работника;\n\t2 - Список работников;\n\t3 - Найти работника;\n\t4 - Редактировать работника;\n\t5 - Удалить работника;\n\t6 - Сохранить список работников;\n\t7 - Отсортировать и вывести первые n записей;\n\tВыход.\n"
end

def main
    list = ListEmployee.from_json("Лаба 3\\emp.json")
    view = TerminalViewListEmployee.new(list)

    while true
        get_menu
        input = STDIN.gets.chomp
        case input
        when "1"
            view.add_employee
        when "2"
            view.view_list
        when "3"
            view.search_employee
        when "4"
            view.edit_employee
        when "5"
            view.delete_employee
        when "6"
            view.save_to_file
        when "7"
            view.sort
            view.head
        when "8"
            break
        end
    end
end

main