# Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private
# method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.

module Offroadable
  def go_offroad
    "We're taking this baby on the dirt my friend!"
  end
end

class Vehicle
  attr_reader :speed, :vehicle_number
  @@vehicle_number = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@vehicle_number += 1
  end

  def vehicle_numbers
     "There are #{@@vehicle_number} vehicles here."
  end

  def speed_up(new_speed)
    @speed += new_speed
    puts "You speed up by #{new_speed} mph."
  end

  def brake(brake_speed)
    @speed -= brake_speed
    puts "You brake and decrease your speed by #{brake_speed} mph."
  end

  def shut_off
    if @speed == 0
      puts "Let's park this puppy."

    else
      puts "Brake before you turn the car off!"
    end
  end

  def display_age
    "This car is #{calculate_age} years old!"
  end

  private

  def calculate_age
    Time.now.year - @year
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 2
end

ford = MyCar.new(2014, 'Black', 'Ford')
ford.speed_up(60)
puts ford.vehicle_numbers
puts ford.display_age


class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Offroadable
end

rivian = MyTruck.new(2021, 'Silver', 'Rivian')
rivian.speed_up(100)
puts rivian.vehicle_numbers
puts rivian.go_offroad
puts rivian.display_age