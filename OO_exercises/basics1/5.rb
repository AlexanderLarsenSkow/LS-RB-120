# Hello Sophie Part 1

# Add a parameter to the initialize method in the Cat class that provides a name for the cat
# Create an instance variable for the name and provide a greeting with teh name.

class Cat
  def initialize(name)
    @name = name
    puts "I'm a cat! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
cat_man = Cat.new('Pants')