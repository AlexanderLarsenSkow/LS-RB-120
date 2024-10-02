# Create a class Cat that can do all these things except swim and fetch.
# Create a class hierarchy here.
# Create an animal class that can do all these thing

# Animal can jump and run
# Dog can speak but it's different
# Cat can speak but it's different

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end


class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    "meow!"
  end
end

pete = Animal.new
kitty = Cat.new
dave = Dog.new
# bud = Bulldog.new

puts pete.run                # => "running!"
# puts pete.speak              # => NoMethodError

puts kitty.run               # => "running!"
puts kitty.speak             # => "meow!"
# puts kitty.fetch             # => NoMethodError

puts dave.speak              # => "bark!"

# puts bud.run                 # => "running!"
# puts bud.swim                # => "can't swim!"