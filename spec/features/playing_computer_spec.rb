describe "playing the computer", type: :feature do
    
    it "gives the option to play the computer" do
        visit('/')
        fill_in('player1', with: 'Player 1')
        click_button('Play!')
        expect(page).to have_content('Player 1 vs Computer')
    end

    it "picks a random choice and determines the winner" do
        visit('/')
        fill_in('player1', with: 'Player 1')
        click_button('Play!')
        allow_any_instance_of(Computer).to receive(:choice).and_return(Scissors)
        click_button("Rock")
        expect(page).to have_content('Player 1 wins!')
    end

    it "allows player 1 to have the first turn at the start of the next round" do
        visit('/')
        fill_in('player1', with: 'Player 1')
        click_button('Play!')
        allow_any_instance_of(Computer).to receive(:choice).and_return(Scissors)
        click_button("Rock")
        click_button("Play again!")
        expect(page).to have_content("Player 1's turn")
    end

end