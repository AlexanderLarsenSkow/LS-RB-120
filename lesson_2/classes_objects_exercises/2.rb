# Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.


# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

class Person
  attr_accessor :last_name

  def initialize(name)
    @name = name
    @last_name = ''
  end

  def name
    return "#{@name} #{last_name}" unless last_name == ''
    @name
  end

  def first_name
    name.split.first
  end

end


bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
p bob.first_name