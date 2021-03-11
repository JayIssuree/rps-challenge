def sign_in_and_play
    visit('/')
    fill_in('player1', with: 'Player 1')
    fill_in('player2', with: 'Player 2')
    click_button('Play!')
end