class Emails
  attr_reader(:email, :type)

  define_method(:initialize) do |attributes|
    @email = attributes.fetch(:email)
    @type = attributes.fetch(:type)
  end

  define_method(:one_line) do
    one_line = ""
    one_line += @type + ": " + @email
  end
end
