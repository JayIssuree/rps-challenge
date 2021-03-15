require 'game'

describe Game do

    let(:player_class) { double :player_class, :new => player }
    let(:player) { double :player }
    let(:computer_class) { double :computer_class, :new => computer }
    let(:computer) { double :computer, :name => "Computer" }
    let(:player1) { double :player, :reset_choice => nil }
    let(:player2) { double :player, :reset_choice => nil }
    let(:rock) { double :rock, :name => "Rock" }
    let(:paper) { double :paper, :name => "Paper" }
    let(:scissors) { double :scissors, :name => "Scissors" }
    let(:choices) { [rock, paper, scissors] }
    let(:subject) { Game.new(player1: player1, player2: player2, choices: choices) }
    
    describe '.create' do
        
        it 'creates a new game instance' do
            expect(Game.create(player1: "player1", player2: "player2", player_class: player_class, computer_class: computer_class, choices: choices)).to be_an_instance_of(Game)
        end

        it 'creates a game instance with a computerized opponent' do
            expect(Game.create(player1: "player1", player2: "", player_class: player_class, computer_class: computer_class, choices: choices)).to be_an_instance_of(Game)
            expect(Game.current_game.player2).to eq(computer)
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

    describe '#draw?' do
        
        it 'returns true if there is a draw' do
            allow(player1).to receive(:choice).and_return(rock)
            allow(player2).to receive(:choice).and_return(rock)
            expect(subject).to be_draw
        end

    end

    describe '#next_round' do
        
        it 'resets the players choices for a new round' do
            allow(player1).to receive(:choice).and_return(rock)
            allow(player2).to receive(:choice).and_return(rock)
            expect(player1).to receive(:reset_choice)
            expect(player2).to receive(:reset_choice)
            subject.next_round
        end

        it 'increases the score of the winner' do
            allow(player1).to receive(:choice).and_return(rock)
            allow(player2).to receive(:choice).and_return(scissors)
            expect(player1).to receive(:incriment_score)
            allow(subject).to receive(:winner).and_return(player1)
            subject.next_round
        end

    end

    context "computer" do

        it "chooses a random chioce" do
            expect(subject.choices).to receive(:sample)
            subject.random_choice
        end

        it "goes through all the notions when its the computers turn" do
            subject = Game.new(player1: player1, player2: computer, choices: choices)
            expect(computer).to receive(:choose)
            subject.switch_turns
            subject.computer_turn
        end

    end

end