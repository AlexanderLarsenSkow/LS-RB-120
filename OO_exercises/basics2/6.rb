# Colorful Cat

# Create a Cat class that prints a greeting when #greet is invoked. This should involve name and color
# color is a consant.

class Cat
  COLOR = 'black'
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello! I'm a #{COLOR} cat and my name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet