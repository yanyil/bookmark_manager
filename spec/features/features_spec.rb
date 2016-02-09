# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
feature 'see a list of links on the homepage' do

  scenario "seeing the links" do
    visit '/'
    expect(page).to have_content('List')
  end

  scenario "click on a link in the list" do
    visit '/'
    click_link 'title'
    expect(page).to have_content('Hello')
  end
end
