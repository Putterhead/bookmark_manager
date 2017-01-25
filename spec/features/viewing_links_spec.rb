require 'spec_helper'


feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://zty.pe/', title: 'ZType')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('ZType')
    end
  end
end
  
