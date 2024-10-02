# What's the Output?

# Think about any undesirable effects of this code.
# Fix any errors

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    # @name.upcase!
    "My name is #{name.upcase}."
  end
end

name = 'Fluffy' # string
fluffy = Pet.new(name) # Fluffy to_s'd
puts fluffy.name # fluffy.name.to_s => "Fluffy"
puts fluffy # My name is FLUFFY
puts fluffy.name # FLUFFY
puts name # FLUFFY

# Undesirable Effects:
  # Because the original #to_s method uses String #upcase! on the instance variable,
    # it mutates that instance variable, which is an undesirable effect.
  # Another problem is that the instance variable is the same object as the `name` variable, so this is
    # also mutated by the operation in #to_s.

# Fix:
  # don't mutate it in to_s. Just call #upcase.


# Further Exploration:
  # The integer is passed into the new object as a the name but is turned into a string, creating a new object.
  # The name variable in the outer scope of the program still references an integer at the end.
  
name = 42 # 42
fluffy = Pet.new(name) # '42'
name += 1 # 43
p fluffy.name # '42'
puts fluffy # My name is 42
p fluffy.name # 42
puts name # 43