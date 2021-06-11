require 'fox16'
include Fox
require_relative "Window_view_employee"


class Window_view_employee_list < FXMainWindow
    def initialize(app, controller_list)
        super(app, "Employees" , :width => 600, :height => 400)
        @controller_list = controller_list

        @combobox = FXComboBox.new(self, 50, :width => 300)
        @combobox.font = FXFont.new(getApp(), "Arial", 14, FONTWEIGHT_BOLD,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @combobox.numVisible = 5
        @combobox.selBackColor = Fox.FXRGB(219, 112, 147)

        @add_instance_button = FXButton.new(self, "ADD", :x => 200, :y => 200)
        @add_instance_button.connect(SEL_COMMAND) do |sender, selector, data|
            @controller_list.new_instance
        end

        @show_instance_button = FXButton.new(self, "SHOW", :x => 200, :y => 200)
        @show_instance_button.connect(SEL_COMMAND) do |sender, selector, data|
            @controller_list.show_instance(@combobox.currentItem)
        end

        @delete_instance_button = FXButton.new(self, "DELETE", :x => 200, :y => 200)
        @delete_instance_button.connect(SEL_COMMAND) do |sender, selector, data|
            @controller_list.delete_instance(@combobox.currentItem)
        end
    end

    def show_list(list)
        @combobox.clearItems
        list.each_with_index do |item, i|
            @combobox.appendItem(item.to_s)
        end 
        @combobox.currentItem = 0
    end

    def show
        super(PLACEMENT_SCREEN)
        @controller_list.show_list
    end

    def create
        super
    end

    def create_instance_view(controller_instance)
        Window_view_employee.new(controller_instance)
    end
end
