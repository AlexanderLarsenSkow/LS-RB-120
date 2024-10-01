# Reader

# Using the cat class, add a getter method and invoke it in place of @name in #greet

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, my name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

# getter methods are useful for invoking inside and outside the class

puts kitty.name