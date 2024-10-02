# Transportation

# Create a module called Transportation that contains 3 classes: Vehicle, Truck, and Car.
# Truck and Car should inherit from Vehicle

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end

end

truck = Transportation::Truck.new

puts truck
