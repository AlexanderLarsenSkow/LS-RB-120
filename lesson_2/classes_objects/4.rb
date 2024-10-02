# Dry the code
# Code has been dried.

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{first_name} #{last_name.strip}"
  end

  def name=(name)
    parse_full_name(name)
  end

  private

  def parse_full_name(full_name)
    words = full_name.split
    @name = full_name
    self.first_name = words.first
    self.last_name = words.size > 1 ? words.last : ''
  end

end

# How can we compare if the two Person objects have the same name?

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name
