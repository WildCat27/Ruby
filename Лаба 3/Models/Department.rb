class Department
    attr_reader :posts, :name

    def initialize(name)
        @name = name
    end

    def posts=(posts)
        @posts = posts
    end

    def to_s
        "Отдел: #{@name}\n" + @posts.join("\n")
    end

    def read_DB
        posts.read_DB
    end
end