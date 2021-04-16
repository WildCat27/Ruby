class Salary
    def initialize(value)
        @value = value
    end

    def get_salary
        return value
    end
end


class SalaryDecorator < Salary
    attr_accessor :salary

    def initialize(salary)
        @salary = salary
    end
  
    def operation
        @salary.get_salary
    end
end


class FixedPremiumSize < SalaryDecorator
    attr_accessor :fixed_premium_size

    def operation
        return @salary.get_salary + @fixed_premium_size
    end
end


class QuarterlyAwardSize < SalaryDecorator
    attr_accessor :quarterly_award_size

    def operation
        return @salary.get_salary * (1 + @quarterly_award_size / 100)
    end
end


class PossibleBonusPercent < SalaryDecorator
    attr_accessor :possible_bonus_percent

    def operation
        return @salary.get_salary + super.get_salary * @possible_bonus_percent / 100
    end
end