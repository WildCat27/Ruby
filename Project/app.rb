require "require_all"
require_relative "Fabric/Terminal_fabric"
require_relative "Fabric/Window_fabric"
require_relative "Views/Terminal_view_list"
require_relative "Fabric/Employee_fabric"
require_relative "Views/Window_view_info"


#controller.from_json("/home/diana/Documents/Ruby/Лаба 3/data/emp.json")
=begin
Employee_fabric.fabric.view_fabric = Terminal_fabric.new
controller = Employee_fabric.fabric.controller_list
controller.show
=end

FXApp.new do |app|
    Employee_fabric.fabric.view_fabric = Window_fabric.new(app)
    controller = Employee_fabric.fabric.controller_list
    if !DBController.controller.try_connect
        message = Window_view_info.new(app, "Ошибка подключения", "Не удалось подключиться к базе данных.\n Данные будут загружены из резервной копии")
        message.show
        controller.from_json("emp.json")
    else
        controller.read_from_db
    end
        
    controller.show
    app.create
    app.run
end

#controller.choose_instance(2)
#controller.replace(0)
#controller.show_view
#controller.to_json("/home/diana/Documents/Ruby/Лаба 3/data/emp.json")