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

# Explain what @@cats_count variable is and what it does. Test your ideas with code.

# `@@cats_count`, defined on line 2, is a class variable defined in the class scope. it references the integer 0, and every time
# a new `Cat` object is instantiated, 1 is added to the value of `@@cats_count`, as seen on line 7 in the `initialize` method.
# We can see the current value the class variable references from `self.cats_count`, a class method which returns the
# value of `@@cats_count`.

# Here we can test it:

p Cat.cats_count # => 0
Cat.new('brown')
p Cat.cats_count # => 1

# Creating a new cat object on line 25 adds 1 to the count that the class variable references. In this way,
# we can check and see what a class variable is doing.

