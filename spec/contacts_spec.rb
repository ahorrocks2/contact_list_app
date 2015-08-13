require('rspec')
require('contacts')
require('phone_numbers')
require('mailing_addresses')
require('emails')

describe(Contacts) do
  before() do
    Contacts.clear()
  end

  describe('#first_name') do
    it('returns the first name of the contact') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.first_name()).to(eq('Joe'))
    end
  end
  describe('#last_name') do
    it('returns the last name of the contact') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.last_name()).to(eq('Smith'))
    end
  end
  describe('#job') do
    it('returns the job of the contact') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.job()).to(eq('Plumber'))
    end
  end
  describe('#company') do
    it('returns the company of the contact') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.company()).to(eq('Smith & Sons'))
    end
  end
  describe('#save') do
    it('adds the contact to the master list of contacts') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.save()
      expect(Contacts.all()).to(eq([test_contact]))
    end
  end
  describe('.clear') do
    it('clear the master list of contacts') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.save()
      Contacts.clear()
      expect(Contacts.all()).to(eq([]))
    end
  end
  describe('#id') do
    it('returns the id number of a contact') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.save()
      expect(test_contact.id()).to(eq(1))
    end
  end
  describe('.find') do
    it('finds a contact based on their id number') do
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.save()
      expect(Contacts.find(1)).to(eq(test_contact))
    end
  end
  describe('#add_phone') do
    it('adds a phone number to the contact information') do
      test_phone = PhoneNumbers.new({:area_code => 503, :main_number => 999-9999, :type => 'work'})
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.add_phone(test_phone)
      expect(test_contact.show_me_the_phones()).to(eq([test_phone]))
    end
  end
  describe('#clear_phones') do
    it('clears the phone list of a contact') do
      test_phone = PhoneNumbers.new({:area_code => 503, :main_number => 999-9999, :type => 'work'})
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.add_phone(test_phone)
      test_contact.clear_phones()
      expect(test_contact.show_me_the_phones()).to(eq([]))
    end
  end

  describe('#add_email') do
    it('adds an email to the contact info') do
      test_email = Emails.new({:email => 'joe.smith@fake.com', :type => 'work'})
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.add_email(test_email)
      expect(test_contact.show_me_the_emails()).to(eq([test_email]))
    end
  end
  describe('#clear_emails') do
    it('clears the email list of a contact') do
      test_email = Emails.new({:email => 'joe.smith@fake.com', :type => 'work'})
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.add_email(test_email)
      test_contact.clear_emails()
      expect(test_contact.show_me_the_emails()).to(eq([]))
    end
  end

  describe('#add_mailing_address') do
    it('adds a mailing address to the contact info') do
      test_address = MailingAddresses.new({:street_address => '42 Wallaby Way', :city => 'Sydney', :state => 'AU', :zip => 55555, :type => 'home'})
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.add_mailing_address(test_address)
      expect(test_contact.show_me_the_addresses()).to(eq([test_address]))
    end
  end
  describe('#clear_mailing_addresses') do
    it('clears the address list of a contact') do
      test_address = MailingAddresses.new({:street_address => '42 Wallaby Way', :city => 'Sydney', :state => 'AU', :zip => 55555, :type => 'home'})
      test_contact = Contacts.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      test_contact.add_mailing_address(test_address)
      test_contact.clear_mailing_addresses()
      expect(test_contact.show_me_the_addresses()).to(eq([]))
    end
  end
end






describe(PhoneNumbers) do
  describe('#area_code') do
    it('returns the area code of the contact') do
      test_phone = PhoneNumbers.new({:area_code => 919, :main_number => 555-5555, :type => 'cell'})
      expect(test_phone.area_code()).to(eq(919))
    end
  end
  describe('#main_number') do
    it('returns the main number of the contact') do
      test_phone = PhoneNumbers.new({:area_code => 919, :main_number => 555-5555, :type => 'cell'})
      expect(test_phone.main_number()).to(eq(555-5555))
    end
  end
  describe('#type') do
    it('returns the phone number type of the contact') do
      test_phone = PhoneNumbers.new({:area_code => 919, :main_number => 555-5555, :type => 'cell'})
      expect(test_phone.type()).to(eq('cell'))
    end
  end
end




describe(MailingAddresses) do
  describe('#street_address') do
    it('returns the street address of the contact') do
      test_address = MailingAddresses.new({:street_address => '42 Wallaby Way', :city => 'Sydney', :state => 'AU', :zip => 55555, :type => 'home'})
      expect(test_address.street_address()).to(eq('42 Wallaby Way'))
    end
  end
  describe('#city') do
    it('returns the city of the contact') do
      test_address = MailingAddresses.new({:street_address => '42 Wallaby Way', :city => 'Sydney', :state => 'AU', :zip => 55555, :type => 'home'})
      expect(test_address.city()).to(eq('Sydney'))
    end
  end
  describe('#state') do
    it('returns the state of the contact') do
      test_address = MailingAddresses.new({:street_address => '42 Wallaby Way', :city => 'Sydney', :state => 'AU', :zip => 55555, :type => 'home'})
      expect(test_address.state()).to(eq('AU'))
    end
  end
  describe('#zip') do
    it('returns the zip of the contact') do
      test_address = MailingAddresses.new({:street_address => '42 Wallaby Way', :city => 'Sydney', :state => 'AU', :zip => 55555, :type => 'home'})
      expect(test_address.zip()).to(eq(55555))
    end
  end
  describe('#type') do
    it('returns the type of the contact') do
      test_address = MailingAddresses.new({:street_address => '42 Wallaby Way', :city => 'Sydney', :state => 'AU', :zip => 55555, :type => 'home'})
      expect(test_address.type()).to(eq('home'))
    end
  end
end





describe(Emails) do
  describe('#email') do
    it('returns the email address of the contact') do
      test_email = Emails.new({:email => 'joe.smith@fake.com', :type => 'work'})
      expect(test_email.email()).to(eq('joe.smith@fake.com'))
    end
  end
  describe('#type') do
    it('returns the type of the email address of the contact') do
      test_email = Emails.new({:email => 'joe.smith@fake.com', :type => 'work'})
      expect(test_email.type()).to(eq('work'))
    end
  end
end
