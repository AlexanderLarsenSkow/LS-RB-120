# Method Lookup Part 1

# Determine the Method Lookup Path when invoking cat1.color
# Only list the methods that are checked by Ruby when searching for the color method.

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
puts cat1.color # => Cat Animal
p Cat.ancestors