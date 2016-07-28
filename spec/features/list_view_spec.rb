require 'spec_helper'

feature 'shows list of links homepage' do
  scenario 'visit homepage' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end

  scenario 'I would like to filter links by tag' do
    Link.create(url: 'http://www.bubbles.com',
                title: 'Bubbles',
                tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.google.com',
                title: 'Google',
                tags: [Tag.create(name: 'search')])

    visit '/tags/bubbles'
    expect(page.status_code).to eq 200

    expect(page).to have_content 'bubbles'
    expect(page).not_to have_content 'search'
  end
end

DatabaseCleaner.clean
