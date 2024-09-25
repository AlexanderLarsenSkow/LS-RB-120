# What is a module? What is its purpose? How do we use them with classes?
# Create a module for the class created in Exercise 1 and include it properly


# I can create a module with the module..end keywords. It looks like this will usually include some kind of custom
  # method that I can call with a . on an object created from my custom class.
  
  # What is a module?
    # These are colletions of behaviors (so methods) that we can use to mix in (or include) in our classes
    # This way, modules can be passed around to specific areas in our code. Cool.
    

module Slither

  def slither(sound)
    puts sound
  end
end

class SnakeMan
  include Slither
end

snakey = SnakeMan.new
snakey.slither('slllllllllll')
p SnakeMan.ancestors