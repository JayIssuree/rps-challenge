require 'player'

describe Player do

    let(:subject) { described_class.new(name: "Rspec Player")}
    let(:rock) { double :rock }
    
    describe '#initialize' do
        
        it 'is initialized with a name' do
            expect(subject.name).to eq("Rspec Player")
        end

    end

    describe '#chooses' do
        
        it 'saves the players choice' do
            expect{ subject.choose(rock) }.to change{ subject.choice }.from(nil).to(rock)
        end

    end

end