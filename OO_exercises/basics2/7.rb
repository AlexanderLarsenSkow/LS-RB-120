# Identify Yourself Part 2

# Update the following class so that it prints "I'm Sophie!" when you call puts on kitty

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty