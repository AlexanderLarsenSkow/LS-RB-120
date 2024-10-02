# Counting Cats

# Add a count tracker class variable to the Cat class. It tracks how many objects we have.
# Print this value with ::total

class Cat
  @@cats_total = 0

  def initialize
    @@cats_total += 1
  end

  def self.total
    @@cats_total
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

p Cat.total