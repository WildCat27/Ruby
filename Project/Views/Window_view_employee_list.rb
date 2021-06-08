require 'fox16'
include Fox
require_relative "Window_view_employee"


class Window_view_employee_list < FXMainWindow
    def initialize(app, controller)
        super(app, "Employees" , :width => 600, :height => 400)
        @combobox = FXComboBox.new(self, 50, :width => 300)
        @combobox.font = FXFont.new(getApp(), "Arial", 14, FONTWEIGHT_BOLD,FONTSLANT_ITALIC, FONTENCODING_CP1251)
        @combobox.numVisible = 5
        @combobox.selBackColor = Fox.FXRGB(219, 112, 147)
        @add_button = FXButton.new(self, "ADD", :x => 200, :y => 200)

    end

    def show_list(list)
        list.each_with_index do |item, i|
            @combobox.appendItem(item.to_s)
        end 
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end

    def create_instance_view(controller_instance)
        Window_view_employee.new(controller_instance)
    end
end
