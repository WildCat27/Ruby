require "mysql2"
require_relative "Singleton"

class DBController
    private_class_method :new
    
    def self.controller
        @@controller ||= new
    end

    def try_connect
        begin
            @client = Mysql2::Client.new(
                :host => "localhost", 
                :username => "test_user",
                :password => "test_user",
                :database => "Staff"
            )
            true
        rescue
            false
        end
    end

    def initialize
        try_connect
        @requests = []
    end



    def execute(request, *args)
        @requests << [request, args]
        while !@requests.empty?
            if @client || try_connect
                req = @requests.shift
                statement = @client.prepare(req[0])
                if result = statement.execute(*(req[1]))
                    result = result.entries
                end
            end
        end 
        result
    end
end