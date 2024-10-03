# Buggy Code : Car Mileage

# Fix the code so it works!

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    self.mileage += miles
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

# The problem was in the implementation of #increment_mileage.
# It returned a total but didn't actual increment the value referenced by @mileage.
# Using assignment addition with the += operator fixes that issue.