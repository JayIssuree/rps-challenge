describe "the homepage", type: :feature do

    it "contains the title of the page" do
        visit('/')
        expect(page).to have_content('Rock, Paper, Scissors')
    end

end