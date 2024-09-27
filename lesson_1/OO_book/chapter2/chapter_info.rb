# module Speak
#   def speak(sound)
#     puts sound
#   end
# end

class GoodDog
  attr_accessor :name     # Can be used to replace actually defining the getter and setter methods for objects in the class.

  def initialize(name)
    @name = name
  end

  def speak
    p "#{@name} says Arf!"
  end

  # def name            # getter method
  #   p @name
  # end

  # def name=(name)     # setter method
  #   @name = name
  # end

end

jimmy = GoodDog.new('Jimmy')
paulie = GoodDog.new('Paulie')

jimmy.speak
paulie.speak
puts jimmy.name

puts jimmy.name = 'Davie'
puts jimmy.name