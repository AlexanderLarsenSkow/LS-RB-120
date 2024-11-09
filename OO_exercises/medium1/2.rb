# Fixed Array
# This code should output `true` 16 times.

class IndexError < StandardError

end

class FixedArray
  attr_reader :items

  def initialize(size)
    @size = size
    @items = [nil] * size
  end

  def to_a
    items
  end

  def out_of_bounds?(index)
    index > (items.size - 1)
  end

  def [](index)
    raise IndexError if out_of_bounds?(index)
    items[index]
  end

  def []=(index, value)
    raise IndexError if out_of_bounds?(index)
    items[index] = value
  end

  def to_s
    items.to_s
  end

  def validate_items
    raise("index")
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
p fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false#
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
