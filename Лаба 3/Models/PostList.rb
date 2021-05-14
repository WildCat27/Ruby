require_relative "../Controllers/DBController"

class PostList < List
    attr_writer :read_db_strategy
    attr_accessor :department

    def read_DB
        if department
            data = @read_db_strategy.read_DB(@department.name)
        else
            data = @read_db_strategy.read_DB
        end
        data.each do |str|
            post = Post.new(
                str["post_name"], 
                str["fixed_salary"], 
                str["fixed_premium_bool"], 
                str["fixed_premium_size"], 
                str["quarterly_award_bool"], 
                str["quarterly_award_size"], 
                str["possible_bonus_bool"], 
                str["possible_bonus_percent"]
            )
            self.add(post)
        end
    end
end

class ReadDBPostsStrategy
    def read_DB
    end
end

class HasDepartment < ReadDBPostsStrategy
    def read_DB(department_name)
        request = "SELECT * FROM posts WHERE department_id == 
        (SELECT department_id FROM departments WHERE department_name == ?)"
        DBController.controller.execute(request, department_name)
    end
end

class NoDepartment < ReadDBPostsStrategy
    def read_DB
        request = "SELECT * FROM posts WHERE employee_id IS NOT NULL"
        DBController.controller.execute(request)
    end
end



=begin
def initialize
        @posts = Array.new
    end

    def add(post)
        @posts << post
    end

    def choose(index)
        @posts[index]
    end
=end