# Complete the Program: Houses

# You can only make 1 new method.

class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    self.price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def compare (other_house)
#     self.price > other_house.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home2.compare(home1)
# puts "Home 2 is more expensive" if home2.compare(home1)