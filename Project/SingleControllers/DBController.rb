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
            ) if !@client
            true
        rescue Mysql2::Error::ConnectionError
            false
        end
    end

    def initialize
        @requests = []
        try_connect
    end

    def execute(request, *args)
        @requests.append([request, args])
        begin
            if (@client || try_connect)
                while !@requests.empty?
                    req = @requests[0]
                    statement = @client.prepare(req[0])
                    if result = statement.execute(*(req[1]))
                    result = result.entries
                    end
                    @requests.delete_at(0)
                end
                result
            else
                raise Mysql2::Error::ConnectionError.new("Ошибка подключения")
            end 
        rescue Mysql2::Error::ConnectionError
            @client = false
            return false
        end
    end
end