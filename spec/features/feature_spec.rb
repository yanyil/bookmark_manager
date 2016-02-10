#As a time-pressed user
#So that I can quickly go to web sites I regularly visit
#I would like to see a list of links on the homepage
require_relative '../../app.rb'

describe 'see a list of links on the homepage' do
  it 'displays a list of links' do
    AddBookmark.create(name: "Google", link: "http://www.google.co.uk")   
    visit('/')
    expect(page).to have_content('Google')
    click_link('http://www.google.co.uk')
  end
end
