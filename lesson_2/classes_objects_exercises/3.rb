# Now create a smart name= method that can take just a first name or a full name,
# and knows how to set the first_name and last_name appropriately.

# Input: string
# Output: setting the instance variable equal to a one word string or two word string

# Rules:
  # Create a name= setter method that knows whether it is dealing with a first or last name
  # and sets them accordingly.

# Examples:

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# bob.first_name            # => 'John'
# bob.last_name             # => 'Adams'

# Data Structures:
  # Split by words
  # if the size of the array is greater than 1, then we take the last and set it equal to the @last_name instance variable
  # first name gets the first part of the array
  #

# Algorithm:
  # Set the name IV to the argument
  # Split the argument into an array of words
  # Set the first part to the first name
  # Set the second part to last name if it exists; otherwise, ''
  # return value doesn't matter since this is a mutating method, right? LMAO this is confusing.
  
  # Good try: However, you have issues where it's not saving what you want to the instance variable itself.
  # Let's change the initialize method to account for this.

class Person
  attr_accessor :last_name

  def initialize(name)
    @name = name
    @first_name = name.split.first
    @last_name = ''
  end

  def name
    return "#{@name} #{last_name}" unless last_name == ''
    @name
  end

  def name=(name)
    words = name.split
    p words
    p name
    @name = name
    @first_name = words.first
    @last_name = words.last if words.size > 1
  end

  def first_name
    # p name
    name.split.first
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