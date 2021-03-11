require 'player'

describe Player do

    let(:subject) { described_class.new(name: "Rspec Player")}
    
    describe '#initialize' do
        
        it 'is initialized with a name' do
            expect(subject.name).to eq("Rspec Player")
        end

    end

end