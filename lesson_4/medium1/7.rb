# Change the method name below so it's more clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status #light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# Change the name to status. Don't need to include the name of the class in the method names.