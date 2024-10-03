# Rectangles and Squares

# Write a class Square that inherits from Rectangle.

# Square should only take one parameter: side length. We don't need super because we don't want the initialize from Rectangle.

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side_length)
    super(side_length, side_length)
  end

end

# Square Output
square = Square.new(5)
puts "area of square = #{square.area}"