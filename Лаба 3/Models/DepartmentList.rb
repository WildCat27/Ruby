require_relative "Department"
require_relative "List"

class DepartmentList < List

    def read_hash(departments_hash)
        departments_hash["departments"].each { |dep|
            self.add(Department.new())
        }
    end
    
    def read_DB
        departments = DBController.controller.execute("SELECT * FROM departments")
    end
end





=begin
def initialize
        @departments = Array.new
    end

    def add(department)
        @departments << department
    end

    def choose(index)
        @departments[index]
    end
=end