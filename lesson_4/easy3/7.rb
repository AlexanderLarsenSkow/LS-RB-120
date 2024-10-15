# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# The reader methods don't add value but return a pre-existing value from an instantiated object.

light = Light.new('high', 'blue')
p light.color # => 'blue'

# Rather than adding value, it retrieves a value.
