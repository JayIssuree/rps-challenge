require './lib/choices/scissors'

describe Scissors do

    let(:paper) { double :paper, :name => "Paper" }
    
     describe '#beats?' do
         
        it 'beats paper' do
            expect(Scissors.beats?(paper)).to eq(true)
        end

     end

end