class Cat
  def self.generic_greeting
    "Hello! I'm a cat!"
  end
end

p Cat.generic_greeting

kitty = Cat.new
p kitty.class.generic_greeting # => still calling this on the class.