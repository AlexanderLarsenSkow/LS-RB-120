# Create a class called MyCar. When you initialize a new instance or object of the class.
# allow the user to define some instance variables that tell us the year, color, and model of the car.
# Create an instance variable that is set to 0 during instantiation of the object
#  to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :year, :color, :model
  attr_reader :speed

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
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

ford_focus = MyCar.new(2014, 'black', 'focus')
ford_focus.speed_up(60)
ford_focus.brake(30)
puts ford_focus.speed
ford_focus.shut_off
ford_focus.brake(30)
puts ford_focus.speed
ford_focus.shut_off