# Method Lookup Path Part 2

# List all the Modules / Classes Ruby will check looking for the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
# puts cat1.color # Cat Animal Object Kernel BasicObject

puts Cat.ancestors

