require './lib/choices/paper'

describe Paper do

    let(:rock) { double :rock, :name => "Rock" }
    
     describe '#beats?' do
         
        it 'beats rock' do
            expect(Paper.beats?(rock)).to eq(true)
        end

     end

end