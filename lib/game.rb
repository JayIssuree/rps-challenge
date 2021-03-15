require_relative 'player'
require_relative 'computer'
Dir["./lib/choices/*.rb"].each {|file| require file }

class Game

    DEFAULT_CHOICES = [Rock, Paper, Scissors]

    def self.create(player1:, player2:, player_class: Player, computer_class: Computer, choices: DEFAULT_CHOICES)
        player_1 = player_class.new(name: player1)
        player_2 = player2 == "" ? computer_class.new : player_class.new(name: player2)
        @current_game = Game.new(player1: player_1, player2: player_2, choices: choices)
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

    def draw?
        complete? && player1.choice == player2.choice
    end
    
    def next_round
        winner.incriment_score unless draw?
        players.each{ |player|
            player.reset_choice
        }
    end

    def random_choice
        choices.sample
    end

    def computer_turn
        current_player.choose(random_choice) if current_player.name == "Computer"
    end

end