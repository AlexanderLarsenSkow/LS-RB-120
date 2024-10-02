# What is the method lookup path and how is it important?

# The method lookup path is the path that Ruby searches for a method for an object.
# If it can't find a particular method in the current class, it will go 1 superclass up in the lookup path and take from there.

# So, for instance, so if there is no method on array, it would look in the next class up which is Enumerable.

puts Array.ancestors