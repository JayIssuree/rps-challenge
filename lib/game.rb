require_relative 'player'

class Game

    def self.create(player1:, player2:, player_class: Player)
        @current_game = Game.new(player1: player_class.new(name: player1), player2: player_class.new(name: player2))
    end

    def self.current_game
        @current_game
    end

    attr_reader :player1, :player2, :players, :current_player

    def initialize(player1:, player2:)
        @player1 = player1
        @player2 = player2
        @players = [player1, player2]
        @current_player = players.first
    end

    def switch_turns
        @current_player = players.reject{|player|
            player == current_player
        }.first
    end

end