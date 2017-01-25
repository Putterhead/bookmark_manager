require 'spec_helper'


feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    link = Link.new(url: "ztype.com", title: "ZType")
    tag = Tag.first_or_create(name: "")
    link.tags << tag
    link.save

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('ZType')
    end
  end
end
