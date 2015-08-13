class PhoneNumbers
  attr_reader(:area_code, :main_number, :type)

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @main_number = attributes.fetch(:main_number)
    @type = attributes.fetch(:type)
  end
end
