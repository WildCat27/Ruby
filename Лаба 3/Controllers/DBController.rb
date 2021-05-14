require "mysql2"

class DBController

    private_class_method :new

    def initialize()
        @client = Mysql2::Client.new(
            :host => "localhost", 
            :username => "test_user",
            :password => "test_user",
            :database => "Staff"
        )
    end

    def execute(request, *args)
        @client.prepare(request)
        @client.execute(*args)
    end

    def self.controller
        @@controller |= new
    end
end