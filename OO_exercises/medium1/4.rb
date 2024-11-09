# Circule Buffer Rules:
  # it has a max size
  # When we add a value, it is added to teh positin that follows teh most recently added thing.
  # When we remove something, we remove the thing that has been there the longest.
  # If the size is full and we add something, we also remove the thing that's been there the longest.

  # Input: max_size for our buffer object
  # Output: put => adds an object, get => remove and return an object

# Examples:

# Data Structures:
  # Continuously rotate the array.
  # When we add, we add from the beginning. So unshift it in.
  # When we remove, we use pop to take from the end.

class CircularBuffer
  attr_reader :items, :max_size

  def initialize(size)
    @max_size = size
    @items = []
  end

  def put(item)
    items.unshift(item)
    get if items.size > max_size
  end

  def get
    items.pop
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil