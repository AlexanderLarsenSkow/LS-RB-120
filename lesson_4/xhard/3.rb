# Change the range method for the sea vehicles so that the range adds another 10 km. Don't do this for the other vehicles.

module FuelEconomy
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WaterVehicle
  include FuelEconomy
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
   super + 10
  end

end

new = WaterVehicle.new(1, 1, 80, 8)
p new.range

class Catamaran < WaterVehicle;end

class MotorBoat < WaterVehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end