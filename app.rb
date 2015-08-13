require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/emails')
require('./lib/mailing_addresses')
require('./lib/phone_numbers')
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
  @contact = Contacts.find(params.fetch('id').to_i())
  street_address = params.fetch('street_address')
  city = params.fetch('city')
  state = params.fetch('state')
  zip = params.fetch('zip')
  type = params.fetch('type')
  new_address = MailingAddresses.new({:street_address => street_address, :city => city, :state => state :zip => zip, :type => type})
  @contact.add_address(new_address)
  redirect('/contact/:id')
end
