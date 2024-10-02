# Prefix the Name

# Add accessor methods
# @name should be returned with 'Mr.'

class Person
  attr_writer :name

  def name
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name