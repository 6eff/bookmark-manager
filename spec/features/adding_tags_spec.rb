# require 'spec_helper'

feature "adding tags" do

  scenario 'adds a tags to a link' do
    visit '/links/new'
    fill_in "title", with: "google"
    fill_in('url', with: 'www.google.com')
    fill_in('tags', with: 'search')
    click_button 'submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end

  scenario 'adds multiple tags to a link' do
    visit '/links/new'
    fill_in "title", with: "google"
    fill_in('url', with: 'www.google.com')
    fill_in('tags', with: 'search resources')
    click_button 'submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search', 'resources')
  end
end
