# Method Lookup Part 3

# List the Method Lookup Path for bird1.color
# Only list the ones that are checked by Ruby

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color # Bird Flyable Animal

puts Bird.ancestors
