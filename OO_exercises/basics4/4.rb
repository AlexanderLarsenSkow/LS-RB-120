# Comparing Names

# Add the right accessor methods
# last_name getters shouldn't be visible outside the class
# first_name getters should be visible outside the class

class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'

puts person1.last_name
puts person1.first_equals_last?