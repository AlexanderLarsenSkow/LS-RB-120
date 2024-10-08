# Unexpected Change

# Change the following code to accept a string containing a first and last name.
# The name should be split into two instance variables in the setter method
# Then joined in the getter method to form a full name.

class Person
  # attr_accessor :name

  def name=(name)
    @first_name, @last_name = name.split

    # names = name.split
    # @first_name = names.first
    # @last_name = names.last
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name