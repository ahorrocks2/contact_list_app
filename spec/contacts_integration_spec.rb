require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add contact path', {:type => :feature}) do
  it('adds a contact to the list') do
    visit('/')
    fill_in('first_name', :with => 'Barack')
    fill_in('last_name', :with => 'Obama')
    fill_in('job', :with => 'President')
    fill_in('company', :with => 'Free World')
    click_button('Add Contact')
    expect(page).to have_content('Barack Obama')
  end

  it('brings user to contact-specific page') do
    visit('/')
    fill_in('first_name', :with => 'Barack')
    fill_in('last_name', :with => 'Obama')
    fill_in('job', :with => 'President')
    fill_in('company', :with => 'Free World')
    click_button('Add Contact')
    click_link('Barack Obama')
    expect(page).to have_content('President')
  end
end
