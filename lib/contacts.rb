class Contacts
  attr_reader(:first_name, :last_name, :job, :company)

  @@all_contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @id = @@all_contacts.length + 1
    @phone_list = []
    @email_list = []
    @address_list = []
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id_to_find|
    found_contact = nil
    @@all_contacts.each() do |contact|
      if contact.id() == id_to_find
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_phone) do |new_phone|
    @phone_list.push(new_phone)
  end

  define_method(:show_me_the_phones) do
    @phone_list
  end

  define_method(:add_email) do |new_email|
    @email_list.push(new_email)
  end

  define_method(:show_me_the_emails) do
    @email_list
  end

  define_method(:add_mailing_address) do |new_address|
    @address_list.push(new_address)
  end

  define_method(:show_me_the_addresses) do
    @address_list
  end
end
