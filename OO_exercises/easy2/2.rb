# Fix the Program: Drivable

# Make the smallest possible change so that the classes have access to #drive

module Drivable
  def drive
    puts "I'm driving!"
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive