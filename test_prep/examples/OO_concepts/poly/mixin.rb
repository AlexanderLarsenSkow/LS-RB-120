module Flyable
  def fly
    "Attack from above."
  end
end

class Monster; end

class Vampire < Monster
  include Flyable
end

class Ghost < Monster
  include Flyable
end

class Mummy < Monster; end

p Vampire.new.fly # => "Attack from above"
p Ghost.new.fly # => "Attack from above"

p Mummy.new.fly # => NoMethodError