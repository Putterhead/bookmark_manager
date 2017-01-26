require 'spec_helper'
# As a user
# So that I can save time when looking for a particular website
# I want to be able to filter my links with keywords

feature 'Filtering links' do

  scenario 'I want to be able to find bookmarks by filtering the links by tag' do

    visit "/links/new"
    enter_links
    click_button('Add new link')

    visit '/tags/news'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('bbc.com')
    end
  end

end
