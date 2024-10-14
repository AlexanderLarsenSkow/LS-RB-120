# What is the default return value of to_s when invoked on an object? Where could you go to find out?

# THe default return value of to_s when invoked on an object is that object converted to a string character(s).
# For example

p 1.to_s # => '1'

# To check this, we would go to the Ruby Docs and check for a to_s method in Object or BasicObject and see its default return value.

# Actually, the default to_s returns the objects Class and encoding of the object's ID.

# A better example:

class Cat;end

cat = Cat.new
puts cat # => #<Cat:12008009>