class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# What does `self` refer to in this code?

# In this code, `self` refers to the instantiated object we are currently working with. We use `self` inside the method 
# `make_one_year_older` because otherwise Ruby will think we are defining a new local variable `age` on line 10.
# `self.age` lets Ruby know we are calling the setter method on the `@age` instance variable and adding 1 to its value.
# 