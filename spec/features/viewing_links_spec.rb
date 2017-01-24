require 'spec_helper'


feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    Link.create(url: 'https://github.com/makersacademy/course/blob/master/course_outline.md', title: 'Makers Academy course outline')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
