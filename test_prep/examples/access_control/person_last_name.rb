class Person
  attr_reader :first_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{first_name} #{last_name[0]}."
  end

  private

  attr_reader :last_name
end

jake = Person.new("Jake", "Sullivan")

p jake.full_name # +> "Jake S."
p jake.last_name # => Private Method NoMethodError