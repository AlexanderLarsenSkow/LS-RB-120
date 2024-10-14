# What does self refer to in this context?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In this context, `self` is used to refer to the class `Cat` itself, not an instantiated object from the `Cat` class.
# `self` written in the first line of a method definition like this: `self.cats_count` always creates a class method.
# In these cases, `self` refers to the class itself.

p Cat.cats_count
Cat.new('brown')
p Cat.cats_count
