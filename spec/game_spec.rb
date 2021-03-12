require 'game'

describe Game do

    let(:player_class) { double :player_class, :new => player }
    let(:player) { double :player }
    let(:player1) { double :player }
    let(:player2) { double :player }
    let(:rock) { double :rock, :name => "Rock" }
    let(:paper) { double :paper, :name => "Paper" }
    let(:scissors) { double :scissors, :name => "Scissors" }
    let(:choices) { [rock, paper, scissors] }
    let(:subject) { subject = Game.new(player1: player1, player2: player2, choices: choices) }
    
    describe '.create' do
        
        it 'creates a new game instance' do
            expect(Game.create(player1: "player1", player2: "player2", player_class: player_class, choices: choices)).to be_an_instance_of(Game)
        end

    end

    describe '.current_game' do
        
        it 'returns the current game' do
            Game.create(player1: "player1", player2: "player2", player_class: player_class, choices: choices)
            expect(Game.current_game).to be_an_instance_of(Game)
        end

    end

    describe '#initialize' do
        
        it 'is initialized with 2 players' do
            expect(subject.player1).to eq(player1)
            expect(subject.player2).to eq(player2)
        end

        it 'is initialized with a set of choices' do
            expect(subject.choices).to eq(choices)
        end

    end

    describe '#switch_turns' do
        
        it 'switches the turn of the current player' do
            expect{ subject.switch_turns }.to change{ subject.current_player }.from(player1).to(player2)
        end

    end

    describe '#winner' do
        
        it 'determines the winner' do
            allow(player1).to receive(:choice).and_return(rock)
            allow(player2).to receive(:choice).and_return(paper)
            allow(rock).to receive(:beats?).with(paper).and_return(false)
            allow(paper).to receive(:beats?).with(rock).and_return(true)
            expect(subject.winner).to eq(player2)
        end

    end

    describe '#get_choice' do
        
        it 'returns the choice from a string' do
            expect(subject.get_choice("Rock")).to eq(rock)
        end

    end

    describe '#complete' do
        
        it 'returns true once both players have made a choice' do
            allow(player1).to receive(:choice).and_return(rock)
            allow(player2).to receive(:choice).and_return(paper)
            expect(subject).to be_complete
        end

    end

end