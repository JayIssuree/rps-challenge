require_relative 'player'
Dir["./lib/choices/*.rb"].each {|file| require file }

class Game

    DEFAULT_CHOICES = [Rock, Paper, Scissors]

    def self.create(player1:, player2:, player_class: Player, choices: DEFAULT_CHOICES)
        @current_game = Game.new(player1: player_class.new(name: player1), player2: player_class.new(name: player2), choices: choices)
    end

    def self.current_game
        @current_game
    end

    attr_reader :player1, :player2, :players, :current_player, :choices


    def initialize(player1:, player2:, choices:)
        @player1 = player1
        @player2 = player2
        @players = [player1, player2]
        @current_player = players.first
        @choices = choices
    end

    def switch_turns
        @current_player = players.reject{|player|
            player == current_player
        }.first
    end

    def winner
        return player1 if player1.choice.beats?(player2.choice)
        return player2 if player2.choice.beats?(player1.choice)
    end
    
    def get_choice(string)
        choices.select{ |choice|
            choice.name == string
        }.first
    end

    def complete?
        true if player1.choice && player2.choice != nil
    end

    private 

    def draw?
        player1.choice == player2.choice
    end

end