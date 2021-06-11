require_relative "Window_view_instance"

class Window_view_employee < Window_view_instance
    def initialize(app, controller_instance)
        super
        @fullname_label = FXLabel.new(self, "Фамилия Имя Отчество")
        @fullname_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @fullname_field = FXTextField.new(self, 30)
        @fullname_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @fullname_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "fullname")
        end


        @birthdate_label = FXLabel.new(self, "Дата рождения")
        @birthdate_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @birthdate_field = FXTextField.new(self, 30)
        @birthdate_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @birthdate_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "birthdate")
        end

        @phone_label = FXLabel.new(self, "Телефон")
        @phone_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @phone_field = FXTextField.new(self, 30)
        @phone_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @phone_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "phone")
        end


        @address_label = FXLabel.new(self, "Адрес")
        @address_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @address_field = FXTextField.new(self, 30)
        @address_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @address_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "address")
        end
        

        @email_label = FXLabel.new(self, "Электронная почта")
        @email_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @email_field = FXTextField.new(self, 30)
        @email_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @email_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "email")
        end


        @passport_label = FXLabel.new(self, "Паспорт")
        @passport_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @passport_field = FXTextField.new(self, 30)
        @passport_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @passport_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "passport")
        end


        @speciality_label = FXLabel.new(self, "Специальность")
        @speciality_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @speciality_field = FXTextField.new(self, 30)
        @speciality_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @speciality_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "speciality")
        end


        @experience_label = FXLabel.new(self, "Опыт работы")
        @experience_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @experience_field = FXTextField.new(self, 30)
        @experience_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @fullname_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "experience")
        end


        @previous_workplace_label = FXLabel.new(self, "Предыдущее место работы")
        @previous_workplace_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @previous_workplace_field = FXTextField.new(self, 30)
        @previous_workplace_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @previous_workplace_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "previous_workplace")
        end


        @previous_position_label = FXLabel.new(self, "Должность на предыдущем месте работы")
        @previous_position_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @previous_position_field = FXTextField.new(self, 30)
        @previous_position_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @previous_position_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "previous_position")
        end


        @previous_wage_label = FXLabel.new(self, "Зарплата на предыдущем месте работы")
        @previous_wage_label.font = FXFont.new(getApp(), "Arial", 12, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)

        @previous_wage_field = FXTextField.new(self, 30)
        @previous_wage_field.font = FXFont.new(getApp(), "Arial", 10, FONTWEIGHT_NORMAL,FONTSLANT_REGULAR, FONTENCODING_CP1251)
        @previous_wage_field.connect(SEL_CHANGED) do |sender, selector, data|
            validate(sender, "previous_wage")
        end
    end

    def show_instance(employee)
        @fullname_field.text = employee.fullname
        @birthdate_field.text = employee.birthdate.strftime("%d.%m.%Y")
        @phone_field.text = employee.phone
        @address_field.text = employee.address
        @email_field.text = employee.email
        @passport_field.text = employee.passport
        @speciality_field.text = employee.speciality
        @experience_field.text = employee.experience.to_s
        @previous_workplace_field.text = employee.previous_workplace
        @previous_position_field.text = employee.previous_position
        @previous_wage_field.text = employee.previous_wage.to_s
    end

    def validate(textfield, param)
        value = textfield.text
        if @controller_instance.check(param, value)
            textfield.backColor = Fox.FXRGB(176, 226, 255)
        else
            textfield.backColor = Fox.FXRGB(255, 106, 106)
        end
    end

    def save
        @controller_instance.save([
            @fullname_field.text,
            @birthdate_field.text,
            @phone_field.text,
            @address_field.text,
            @email_field.text,
            @passport_field.text,
            @speciality_field.text,
            @experience_field.text,
            @previous_workplace_field.text,
            @previous_position_field.text,
            @previous_wage_field.text 
        ])
    end

    def show_message(message)
    end

end