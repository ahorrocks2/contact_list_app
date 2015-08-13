class Contact
  attr_reader(:first_name, :last_name, :job, :company)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
  end
end
