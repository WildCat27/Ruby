class Controller_department < Controller_instance

    def save(fields)
        if @model
            @model.name = fields["name"]
        else
            @model = Department.new(*fields)
        end
    end

    def check(param, value)
        true
    end
end