class MailingAddresses
  attr_reader(:street_address, :city, :state, :zip, :type)

  define_method(:initialize) do |attributes|
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @type = attributes.fetch(:type)
  end

  define_method(:one_line) do
    final_address = ""
    final_address += @type + ": " + @street_address + ", " + @city + ", " + @state + " " + @zip.to_s() + " "
  end
end
