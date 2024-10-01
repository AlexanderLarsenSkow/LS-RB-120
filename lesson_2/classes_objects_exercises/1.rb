# Code the class definition to get this information below:

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.name == 'bob'         # => 'bob'

bob.name = 'Robert'
p bob.name == 'Robert'      # => 'Robert'