require 'player'

describe Player do

    let(:subject) { described_class.new(name: "Rspec Player")}
    let(:rock) { double :rock }
    
    describe '#initialize' do
        
        it 'is initialized with a name' do
            expect(subject.name).to eq("Rspec Player")
        end

    end

    describe '#choose' do
        
        it 'saves the players choice' do
            expect{ subject.choose(rock) }.to change{ subject.choice }.from(nil).to(rock)
        end

    end

    describe '#reset_choice' do

        it 'resets the choice made' do
            subject.choose(rock)
            expect{ subject.reset_choice }.to change{ subject.choice }.from(rock).to(nil)
        end

    end

end