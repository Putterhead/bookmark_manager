feature "adding tags to links" do
  scenario "adding a tag on creation " do

    visit "/links/new"
    enter_links
    click_button('Add new link')

    within 'ul#links' do
      expect(page).to have_content('news')
    end
  end

  scenario "add multiple tags on creation" do
    visit "/links/new"
    enter_links
    click_button('Add new link')
    link = Link.first
    expect(link.tag.map(&:name)).to include 'news', 'entertainment'
    end
end
