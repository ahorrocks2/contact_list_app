require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/emails')
require('./lib/mailing_addresses')
require('./lib/phone_numbers')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @@contacts = Contacts.all()
  erb(:index)
end

post('/new_contact') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job = params.fetch('job')
  company = params.fetch('company')
  @contact = Contacts.new({:first_name => first_name, :last_name => last_name, :job => job, :company => company})
  @contact.save()
  redirect('/')
end

get('/contact/:id') do
  @contact = Contacts.find(params.fetch('id').to_i())
  erb(:contact)
end

post('/new_address') do
  street_address = params.fetch('street_address')
  city = params.fetch('city')
  state = params.fetch('state')
  zip = params.fetch('zip')
  type = params.fetch('type_a')
  id = params.fetch('contact_id')
  new_address = MailingAddresses.new({:street_address => street_address, :city => city, :state => state, :zip => zip, :type => type})
  @contact = Contacts.find(id.to_i())
  @contact.add_mailing_address(new_address)
  redirect('/contact/' + @contact.id().to_s())
end

post('/clear_addresses') do
  id = params.fetch('contact_id')
  @contact = Contacts.find(id.to_i())
  @contact.clear_mailing_addresses()
  redirect('/contact/' + @contact.id().to_s())
end

post('/new_phone') do
  area_code = params.fetch('area_code')
  main_number = params.fetch('main_number')
  type = params.fetch('type')
  id = params.fetch('contact_id')
  new_phone = PhoneNumbers.new({:area_code => area_code, :main_number => main_number, :type => type})
  @contact = Contacts.find(id.to_i())
  @contact.add_phone(new_phone)
  redirect('/contact/' + @contact.id().to_s())
end

post('/clear_phones') do
  id = params.fetch('contact_id')
  @contact = Contacts.find(id.to_i())
  @contact.clear_phones()
  redirect('/contact/' + @contact.id().to_s())
end

post('/new_email') do
  email = params.fetch('email')
  type = params.fetch('type')
  id = params.fetch('contact_id')
  new_email = Emails.new({:email => email, :type => type})
  @contact = Contacts.find(id.to_i())
  @contact.add_email(new_email)
  redirect('/contact/' + @contact.id().to_s())
end

post('/clear_emails') do
  id = params.fetch('contact_id')
  @contact = Contacts.find(id.to_i())
  @contact.clear_emails()
  redirect('/contact/' + @contact.id().to_s())
end
