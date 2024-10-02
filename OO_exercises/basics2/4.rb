# Generic Greeting Part 2

# Add two methods:
  # ::generic_greeting (class method)
  # # personal_greeting (instance method)

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def personal_greeting
    "Hello! My name is #{name}!"
  end

  def self.generic_greeting
    "Hello! I'm a cat!"
  end
  
end

kitty = Cat.new('Sophie')

p Cat.generic_greeting
p kitty.personal_greeting