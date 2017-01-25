# As a user
# So that I can save time in visiting sites I regularly visit
# I want to be able to add links
feature 'Adding links' do
  scenario 'I want to be able to add links to my bookmark manager' do

    visit '/links/new'
    fill_in 'title', with: 'bbc.com'
    fill_in 'url', with: 'www.bbc.co.uk'
    click_button('Add new link')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'bbc.com'
    end
  end
end
