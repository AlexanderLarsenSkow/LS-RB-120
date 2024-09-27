# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar
# class to the superclass. Create a constant in your MyCar class that stores information about the
# vehicle that makes it different from other types of Vehicles.

class Vehicle
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
  attr_accessor :year, :color, :model, :type
  attr_reader :speed

  def initialize(year, color, model, type)
    @year = year
    @color = color
    @model = model
    @type = type
    @speed = 0
  end
  
  NUMBER_OF_DOORS = 2
end

ford = MyCar.new(2014, 'black', 'Ford', 'Sedan')

ford.speed_up(60)
  
  
class MyTruck < Vehicle
  attr_accessor :year, :color, :model
  
  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
  end
  
  NUMBER_OF_DOORS = 2
end 