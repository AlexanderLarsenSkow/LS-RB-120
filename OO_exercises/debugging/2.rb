class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  # def initialize(diet, superpower)
  #   super
  # end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# On line 37, we have to pass in `diet` and `superpower` parameters to the `super` keyword as arguments. This passes them
# into the `initialize` method next further up in the lookup path, which is in `Animal`. Without these parameters,
# teh code will not run because the `initialize` found in `Animal` will receive 3 arguments instead of 2.

# Also the `initialize` method for `FlightlessBird` is also unneccessary, because it has the exact same
# method definition as the `initailize` found in `Animal`, only adding `super` to it. If we get rid of it,
# FlightlessBird objects will use `Animal#initialize` instead because it is an inherited method.