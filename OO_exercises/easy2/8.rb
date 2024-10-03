# Moving

# Modify the code to achieve this output:
# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"

# You can only write one new method.

# Data Structures:
  # Create a class Mammal that is the superclass for all the classes
  # create a method walk that essentially calls every object on their own class and places each one in an array
  # example of Duck Typing.

class Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    "#{self.name} #{self.gait} over."
  end
end

class Person < Mammal
  private

  def gait
    "strolls"
  end
end

class Cat < Mammal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Mammal
  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"