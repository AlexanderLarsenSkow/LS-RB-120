# Walk the Cat

# Create a module named Walkable that has a method called walk
# The method should print "let's go for a walk!" Include it in Cat

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, my name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk