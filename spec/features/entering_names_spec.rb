describe "entering names", type: :feature do
    
    it "contains forms for the player names" do
        visit('/')
        expect(page).to have_field('player1')
        expect(page).to have_field('player2')
        expect(page).to have_button('Play!')
    end

    it "displays the given names on the next page" do
        visit('/')
        fill_in('player1', with: 'Player 1')
        fill_in('player2', with: 'Player 2')
        click_button('Play!')
        expect(page).to have_content('Player 1 vs Player 2')
    end

    it "displays the number of wins of the player" do
        sign_in_and_play
        expect(page).to have_content('Player 1: 0')
        expect(page).to have_content('Player 2: 0')
    end

end