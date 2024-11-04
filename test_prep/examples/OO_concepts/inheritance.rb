module Flyable
  def fly
    "attack from above"
  end
end

class Monster
  def attack
    "Hyahh!"
  end
end

class Mummy < Monster; end

class Vampire < Monster
  include Flyable
end

class Ghost < Monster
  include Flyable
end

p Vampire.new.fly # => "attack from above"
p Ghost.new.fly # => "attack from above"


p Mummy.new.fly # => NoMethodError