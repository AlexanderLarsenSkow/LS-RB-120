# You want to create a nice interface that allows you to accurately describe the action you want your program to perform.
# Create a method called spray_paint that can be called on an object and will modify the color of the car.


class MyCar
  attr_accessor :year, :color, :model
  attr_reader :speed

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Nice! The new color #{new_color} looks great on your car!"
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

betsy = MyCar.new(2024, 'black', 'Focus')
puts betsy
betsy.spray_paint('red')