def enter_links
  fill_in 'title', with: 'bbc.com'
  fill_in 'url', with: 'www.bbc.co.uk'
  fill_in 'tags', with: 'news entertainment'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,   with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  click_button 'Confirm'
end
