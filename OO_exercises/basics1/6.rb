# Hello Sophie Part 2

# Move the greeting from the initialize Method from the previous exercise
# It goes to a greet method now

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, my name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet