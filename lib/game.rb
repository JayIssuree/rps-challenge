class Game

    def self.create(player1:, player2:)
        @current_game = Game.new(player1: player1, player2: player2)
    end

    def self.current_game
        @current_game
    end

    attr_reader :player1, :player2

    def initialize(player1:, player2:)
        @player1 = player1
        @player2 = player2
    end

end