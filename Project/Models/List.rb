class List
    attr_reader :list
    
    def initialize
        @list = Array.new
    end

    def add(instance)
        @list << instance
    end

    def choose(index)
        @list[index]
    end

    def delete(index)
        @list.pop(index)
    end

    def write_hash
    end

    def read_hash
    end

    def read_DB
    end
end