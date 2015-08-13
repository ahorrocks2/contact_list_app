class Emails
  attr_reader(:email, :type)

  define_method(:initialize) do |attributes|
    @email = attributes.fetch(:email)
    @type = attributes.fetch(:type)
  end
end
