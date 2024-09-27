# Inheritance

# Cat and Dog Classes inherit speak method from Animal

class Animal

  def initialize(name)
    @name = name
  end

  def speak
    puts "Hello!"
  end

end

class Dog < Animal
end

class Cat < Animal
end

cat = Cat.new('a')
dog = Dog.new('b')

cat.speak
dog.speak

# Inheritance 2

# If you define the same methods in the super class and sub class, the sub class's method will take precedence.

class Vehicle
  def sound
    puts "vroom"
  end
end

class Airplane < Vehicle
  def sound
    puts "Flying high"
  end
end

class Car < Vehicle
end

car = Car.new
car.sound
plane = Airplane.new
plane.sound

# Bad Dog is sub class to superclass Animal => super calls the method from the superclass for teh subclass BadDog

class BadDog < Animal
  attr_accessor :age, :name

  def initialize(age, name)
    super(name)
    @age = age
  end
end

bear = BadDog.new(3, 'Terry')
p bear