# Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass.
# Create a method to print out the value of this class variable as well.

class Vehicle
  attr_reader :speed, :vehicle_number
  @@vehicle_number = 0

  def initialize
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
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 2
end

ford = MyCar.new
ford.speed_up(60)
puts ford.vehicle_numbers


class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end


ford2 = MyTruck.new
ford2.speed_up(100)
puts ford2.vehicle_numbers