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
    fill_in('first_name', :with => 'Joe')
    fill_in('last_name', :with => 'Biden')
    fill_in('job', :with => 'Vice President')
    fill_in('company', :with => 'Free World')
    click_button('Add Contact')
    click_link('Joe Biden')
    expect(page).to have_content('Vice President')
  end

  it('adds a mailing address to the contact') do
    visit('/')
    fill_in('first_name', :with => 'Nancy')
    fill_in('last_name', :with => 'Pelosi')
    fill_in('job', :with => 'Speaker')
    fill_in('company', :with => 'Of the House')
    click_button('Add Contact')
    click_link('Nancy Pelosi')

    fill_in('street_address', :with => '123 Pennsylvania Ave')
    fill_in('city', :with => 'Washington')
    fill_in('state', :with => 'DC')
    fill_in('zip', :with => '00000')
    fill_in('type', :with => 'Both!')
    click_button('Add Address')
    expect(page).to have_content('Washington')
  end
end
