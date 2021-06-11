class Window_view_instance < FXMainWindow
    def initialize(app, controller_instance)
        super(app, "New employee" , :width => 600, :height => 700)
        @controller_instance = controller_instance
        @fields = Hash.new
        @save_button = FXButton.new(self, "SAVE")
        @save_button.connect(SEL_COMMAND) do |sender, selector, data|
            save
        end
        @cancel_button = FXButton.new(self, "CANCEL")
        @cancel_button.connect(SEL_COMMAND) do |sender, selector, data|
            close
        end
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end

    def show_view
        create
    end

    def save
    end
end