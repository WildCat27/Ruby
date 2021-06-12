require "date"

class Validator
    def self.phone? string
        return true if string =~ /(7|8|\+7)[\-\s]?(\d{3}|(\(\d{3}\)))[\-\s]?\d{3}[\-\s]?\d{2}[\-\s]?\d{2}$/
    end

    def self.validate_phone string
        if phone? string
            string.gsub!(/\D/, "")
            return "#{string[0]}-#{string[1..3]}-#{string[4..10]}"
        else
            raise ArgumentError, "Некорректный номер телефона"
        end
    end

    def self.email? string
        string =~ /([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$/
    end

    def self.validate_email string
        if email? string
            return string.downcase
        else
            raise ArgumentError, "Некорректный адрес электронной почты"
        end
    end

    def self.fullname? string
        # —
        string =~ /\s*[a-zа-яё]+(\-[a-zа-яё]+)?\s+[a-zа-яё]+(\-[a-zа-яё]+)?\s+[a-zа-яё]+\s*([a-zа-яё]+)?\s*$/i
    end

    def self.validate_fullname string
        if fullname? string
            string = (string.strip.squeeze(" ")).downcase
            string.strip!
            string.gsub!(/\s?\-\s?/, "-")
            string.gsub!(/[\s\-]?([a-zа-яё]+)[\s\-]?/) { |str| str.capitalize }
            fullname = string.split
            if fullname[3]
                fullname[3].downcase!
            end
            return fullname.join(" ")
        else
            raise ArgumentError, "Некорректные ФИО"
        end
    end


    def self.string_to_date string
        date = (string.split ".").map { |num| Integer(num)}
        date[2] += 2000 if date[2] < 100
        Date.new date[2], date[1], date[0] if Date.valid_date? date[2], date[1], date[0]
    end


    def self.birthdate? date
        return true if date.class == Date
        return true if date =~ /\d?\d\.\d?\d\.\d\d(\d\d)?$/
        return true if date =~ /\d{4}\-\d{2}\-\d{2}$/
        return false
    end

    def self.validate_birthdate date
        begin
            #Date.strptime(string, "%d.%m.%Y")#.strftime("%d.%m.%Y")
            if birthdate?(date)
                if date.class == String
                    if date =~ /\d{4}\-\d{2}\-\d{2}$/
                        date = Date.strptime(date, "%Y-%m-%d") 
                    end
                    if date =~ /\d?\d\.\d?\d\.\d\d(\d\d)?$/
                        date = string_to_date(date) 
                    end
                end
                return date
            else
                raise
            end
        rescue
            raise ArgumentError, "Некорректная дата рождения"
        end
    end

    def self.passport? string
        string =~ /\s*\d{4}[\-\.\s+]?\d{6}\s*$/
    end

    def self.validate_passport string
        if passport? string
            string.gsub!(/\D/, "")
            string[0..3] + " " + string[4..-1]
        else
            raise ArgumentError, "Некорректный паспорт"
        end
    end

end