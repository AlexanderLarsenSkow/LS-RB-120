# New Attempt on Problem 3.
# We have to change the initialize method where it has 3 values up front.

# I got it! :D

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    names = name.split
    @name = name
    @first_name = names.first
    @last_name = names.size > 1 ? names.last : ''
  end

  def name
    if last_name != '' && @name.split.last != last_name
      "#{@name} #{last_name}"

    else
      @name
    end
  end

  def name=(name)
    words = name.split
    @name = name
    self.first_name = words.first
    self.last_name = words.last if words.size > 1
  end

end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
p bob.name