require 'computer'

describe Computer do

    let(:subject) { described_class.new }
    let(:rock) { double :rock }
    
    describe '#initialize' do
        
        it 'is initialized with a name of computer' do
            expect(subject.name).to eq("Computer")
        end

        it 'is initialized with a score of 0' do
            expect(subject.score).to eq(0)
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

    describe '#incriment_score' do
        
        it 'increases the score' do
            expect{ subject.incriment_score }.to change{ subject.score }.by(1)
        end

    end

end