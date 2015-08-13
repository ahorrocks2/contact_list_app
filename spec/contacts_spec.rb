require('rspec')
require('contacts')

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
