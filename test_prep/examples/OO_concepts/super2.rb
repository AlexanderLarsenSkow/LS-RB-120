class Vegetable
  def taste
    "This is "
  end
end

class Pumpkin < Vegetable
  def taste
    super + "tasty"
  end
end

class Asparagus < Vegetable
  def taste
    super + "disgusting"
  end
end

p Pumpkin.new.taste # => "This is tasty"
p Asparagus.new.taste # => "This is disgusting"