class Window_view_info < FXMainWindow
    def initialize(app, title, message)
        super(app, title , :width => 400, :height => 100)

        @message = FXLabel.new(self, message)
        @message.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @ok_button = FXButton.new(self, "OK")
        @ok_button.connect(SEL_COMMAND) do |sender, selector, data|
            close
        end
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end

end