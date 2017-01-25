feature "adding tags to links" do
  scenario "adding a tag on creation " do

    visit "/links/new"
    fill_in 'title', with: 'bbc.com'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'tags', with: 'news'
    click_button('Add new link')

    within 'ul#links' do
      expect(page).to have_content('news')
    end

  end
end
