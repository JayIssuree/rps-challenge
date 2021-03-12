describe "playing", type: :feature do
    
    it "displays the current players turn" do
        sign_in_and_play
        expect(page).to have_content("Player 1's turn")
    end

    it "contains buttons for rock paper scissors" do
        sign_in_and_play
        expect(page).to have_button("Rock")
        expect(page).to have_button("Paper")
        expect(page).to have_button("Scissors")
    end

    it "switches turns after the first player has selected their choice" do
        sign_in_and_play
        click_button("Rock")
        expect(page).to have_content("Player 2's turn")
    end

    it "determines a winner" do
        sign_in_and_play
        click_button("Rock")
        click_button("Paper")
        expect(page).to have_content("Player 2 wins!")
    end

end