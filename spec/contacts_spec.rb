require('rspec')
require('contacts')
require('phone_numbers')

describe('Contact') do
  describe('#first_name') do
    it('returns the first name of the contact') do
      test_contact = Contact.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.first_name()).to(eq('Joe'))
    end
  end
  describe('#last_name') do
    it('returns the last name of the contact') do
      test_contact = Contact.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.last_name()).to(eq('Smith'))
    end
  end
  describe('#job') do
    it('returns the job of the contact') do
      test_contact = Contact.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.job()).to(eq('Plumber'))
    end
  end
  describe('#company') do
    it('returns the company of the contact') do
      test_contact = Contact.new({:first_name => 'Joe', :last_name => 'Smith', :job => 'Plumber', :company => 'Smith & Sons'})
      expect(test_contact.company()).to(eq('Smith & Sons'))
    end
  end
end

describe('PhoneNumbers') do
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
