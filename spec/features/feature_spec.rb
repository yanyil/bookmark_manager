#As a time-pressed user
#So that I can quickly go to web sites I regularly visit
#I would like to see a list of links on the homepage
# require_relative '../../app/app.rb'
# require_relative '../../app/models/link.rb'

describe 'see a list of links on the homepage' do
  it 'displays a list of links' do
    Link.create(title: "Google", url: "http://www.google.co.uk")
    visit('/links')
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end

describe 'creating links' do
  it 'adds a new link with site address and title' do
    visit('/links')
    click_link('Add Bookmark')
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'http://news.bbc.co.uk'
    click_button 'Submit'
    within 'ul#links' do
      expect(page).to have_content('BBC News')
    end
   end
 end

describe 'adding tags' do
  it 'adds a tag for a link' do
    visit('/links')
    click_link('Add Bookmark')
    fill_in 'title', with: 'Amazon'
    fill_in 'url', with: 'http://www.amazon.com'
    fill_in 'tag', with: 'shopping'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('shopping')
  end
end

describe 'filtering by tags' do
  it 'only shows links tagged with bubbles' do
    visit('/links')
    click_link('Add Bookmark')
    fill_in 'title', with: 'Amazon'
    fill_in 'url', with: 'http://www.amazon.com'
    fill_in 'tag', with: 'bubbles'
    click_button 'Submit'
    visit('/links')
    click_link('Add Bookmark')
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'http://news.bbc.co.uk'
    fill_in 'tag', with: 'news'
    click_button 'Submit'
    visit('/tags/bubbles')
    expect(page).to have_content('Amazon')
    expect(page).not_to have_content('BBC News')
  end
end
