require 'game'

describe Game do

    let(:player) { double :player }
    
    describe '.create' do
        
        it 'creates a new game instance' do
            expect(Game.create(player1: player, player2: player)).to be_an_instance_of(Game)
        end

    end

    describe '.current_game' do
        
        it 'returns the current game' do
            Game.create(player1: player, player2: player)
            expect(Game.current_game).to be_an_instance_of(Game)
        end

    end

    describe '#initialize' do
        
        it 'is initialized with 2 players' do
            subject = Game.new(player1: player, player2: player)
            expect(subject.player1).to eq(player)
            expect(subject.player2).to eq(player)
        end

    end

end