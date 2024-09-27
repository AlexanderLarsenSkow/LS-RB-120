class GoodDog
@@number_of_dogs = 0

def initialize
  @@number_of_dogs += 1
end

def self.total_dogs
  @@number_of_dogs
end

def self.what_am_i
  "I'm a GoodDog class!"
end

end

puts GoodDog.total_dogs

sleepy = GoodDog.new

puts GoodDog.total_dogs
puts GoodDog.what_am_i

## New Example ## CONSTANTS

class GoodDog2
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age = a * DOG_YEARS

  end
end

jake = GoodDog2.new('Jake', 4)
puts jake.name
puts jake.age