# Why is there an error message here?

# bob = Person.new
# bob.hi

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# The issue here is that hi is defined as a private method, so it cannot be called directly on the object like this after it is
# instantiated. However, we can either make this method public to call it on our objects or we can use the return value from this
# method in another method inside the class definition.

# For example:

class Person

  def greeting
    "#{hi} It's great to meet you!"
  end

  private

  def hi
    "Hi!"
  end
end

bob = Person.new
puts bob.greeting