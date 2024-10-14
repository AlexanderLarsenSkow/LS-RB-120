# How do you call a new instance of this class?

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new('clear', 'plastic')

# In order to create a new Bag object, we have to call the #new method and also pass in values to be referenced by the `@color` and
# `@material` instance variables, as defined in the `intitailze` method.