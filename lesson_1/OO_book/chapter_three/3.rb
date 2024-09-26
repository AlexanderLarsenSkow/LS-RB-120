# Debug this code:

# You cannot change the instance variable if you use attr_reader.
# You have to use either attr_accessor or attr_writer methods.

class Person
  attr_accessor :name     # Before: attr:reader :name
  
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name