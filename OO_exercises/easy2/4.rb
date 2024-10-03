# Reverse Engineering

# Write a class that will display
# ABC
# xyz

# for these test cases

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ') => 'xyz' # class method

class Transform
  attr_reader :code

  def initialize(string)
    @code = string
  end

  def uppercase(str=code)
    str.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ') #=> 'xyz'