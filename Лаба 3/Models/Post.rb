require_relative "Employee"
require_relative "Salary"

class Post
    attr_accessor :employee
    
    def initialize(post_name, fixed_salary, fixed_premium_bool, fixed_premium_size, 
        quarterly_award_bool, quarterly_award_size, possible_bonus_bool, possible_bonus_percent)
        @post_name = post_name
        @salary = Salary.new(fixed_salary)
        @salary = FixedPremiumSize.new(@salary, fixed_premium_size) if fixed_premium_bool
        @salary = QuarterlyAwardSize.new(@salary, quarterly_award_size) if quarterly_award_bool
        @salary = PossibleBonusPercent.new(@salary, possible_bonus_percent) if possible_bonus_bool
    end

    def to_s
        "Должность: #{@post_name}\n" + "Работник: #{employee ? employee.to_s : "вакантна"}\n" + @salary.to_s
    end
end