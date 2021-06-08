class Window_view_instance
    def initialize(controller_instance)
        @controller_instance = controller_instance
        @fields = Hash.new
        @save_button = FXButton.new(self, "SAVE", :x => 200, :y => 200)
        @edit_button = FXButton.new(self, "EDIT", :x => 200, :y => 200)
        @cancel_button = FXButton.new(self, "CANCEL", :x => 200, :y => 200)
    end

    def show
        
    end


    def save
        @fields
    end
end