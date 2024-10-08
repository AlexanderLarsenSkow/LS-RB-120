# Towable Part 2

# Create a Vehicle Class that, when a new obj is instantiated, assigns the passed in argument to @year.
# Both Truck and Car inherit from it.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year