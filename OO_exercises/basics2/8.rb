# Public Secret

# Create a Person class
# Make an instance variable called @secret
# Use a setter method to add a value to @secret
# getter to print it

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret