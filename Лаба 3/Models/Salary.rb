class Salary
    def initialize(salary)
        @fixed_salary = salary
    end

    def get_salary
        @fixed_salary
    end
    
    def to_s
        "Фиксированная зарплата: #{@fixed_salary}"
    end
end


class SalaryDecorator < Salary

    def initialize(salary, additional)
        @salary = salary
        @additional = additional
    end
  
    def get_salary
        @salary.get_salary
    end

    def to_s
        @salary.to_s
    end
end


class FixedPremiumSize < SalaryDecorator

    # Here @additional is fixed_premium_size
    def get_salary
        @salary.get_salary + @additional
    end

    def to_s
        "#{@salary}\n" + "Ежемесячная надбавка: #{@additional}"
    end
end


class QuarterlyAwardSize < SalaryDecorator

    # Here @additional is quarterly_award_size
    def get_salary
        @salary.get_salary * (1 + @additional / 100)
    end

    def to_s
        "#{@salary}\n" + "Ежеквартальная премия: #{@additional}"
    end
end


class PossibleBonusPercent < SalaryDecorator

    # Here @additional is possible_bonus_percent
    def get_salary
        @salary.get_salary + @fixed_salary * @additional / 100
    end

    def to_s
        "#{@salary}\n" + "Бонус: #{@additional}%"
    end
end