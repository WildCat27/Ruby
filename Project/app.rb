require "require_all"
require_relative "Controllers/Controller_employee_list"
require_relative "Views/Terminal_view_list"


controller = Controller_employee_list.fabric_terminal
controller.read_from_db
#controller.from_json("/home/diana/Documents/Ruby/Лаба 3/data/emp.json")
controller.show_view


FXApp.new do |app|
    controller = Controller_employee_list.fabric_window(app)
    controller.read_from_db
    controller.show_list
    app.create
    app.run
end

#controller.choose_instance(2)
#controller.replace(0)
#controller.show_view
#controller.to_json("/home/diana/Documents/Ruby/Лаба 3/data/emp.json")