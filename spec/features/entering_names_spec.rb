describe "entering names", type: :feature do
    
    it "should contain forms for the player names" do
        visit('/')
        expect(page).to have_field('player1')
        expect(page).to have_field('player2')
        expect(page).to have_button('Play!')
    end

end