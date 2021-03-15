class Player

    attr_reader :name, :choice, :score

    def initialize(name:)
        @name = name
        @score = 0
    end

    def choose(option)
        @choice = option
    end

    def reset_choice
        @choice = nil
    end

    def incriment_score
        @score+= 1
    end

end