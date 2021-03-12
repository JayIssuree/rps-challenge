require './lib/choices/rock'

describe Rock do

    let(:scissors) { double :scissors, :name => "Scissors" }
    
     describe '#beats?' do
         
        it 'beats scissors' do
            expect(Rock.beats?(scissors)).to eq(true)
        end

     end

end