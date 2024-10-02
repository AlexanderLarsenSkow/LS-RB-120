# Create a bulldog subclass of Dog that cannot swim.

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

class BullDog < Dog
  def swim
    "Can't swim!"
  end
end

terry = BullDog.new
puts terry.speak
puts terry.swim
