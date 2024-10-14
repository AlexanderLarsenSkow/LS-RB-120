module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

small_car = Car.new
small_car.go_fast

# The string printed by calling `go_fast` on `small_car` includes the `'Car'` string because in the body of the method definition
  # from lines 2 to 4 in the `Speed` module, the string includes the lines `self.class`.
  # `self` here references the current instantiated object and `class` is called on this object. Because `go_fast` is called on an
  # instance of the `Car` class, it prints `Car` in that string.
  
  