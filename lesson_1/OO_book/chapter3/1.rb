# Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.

# Divide number of miles traveled by number of gallons per gas it takes to refill

class MyCar
  attr_accessor :year, :color, :model
  attr_reader :speed

  # @@miles_driven = 0
  # @@gas_filled = 0

  def add_miles(m)
    @@miles_driven = m
  end

  def gas_tank(g)
    @@gas_filled = g
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def self.gas_mileage(miles, gas)
    # gas_milage = @@miles_driven / @@gas_filled
    gas_mileage = miles / gas
    "#{miles} divided by #{gas} equals #{gas_mileage} gas mileage!"
    # "#{@@miles_driven} divided by #{@@gas_filled} equals ##{gas_milage} gas milage!"
  end
end

ford = MyCar.new(2014, 'black', 'Ford')
p ford.color
# ford.add_miles(350)
# ford.gas_tank(11)

puts MyCar.gas_mileage(350, 11)

honda = MyCar.new(1999, 'pink', 'Honda')
p honda.model

# p honda.add_miles(300)
# p honda.gas_tank(13)

puts MyCar.gas_mileage(300, 13)
