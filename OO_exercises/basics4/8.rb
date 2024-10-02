# Avoid Mutation

# Do not allow the following code to mutate @name.

class Person
  def name
    @name.clone
  end

  def initialize(name)
    @name = name
  end
end

person1 = Person.new('James')
puts person1.name.reverse!
puts person1.name