class Monster
  def attack
    "Hyahh!"
  end
end

class Vampire < Monster; end

p Vampire.new.attack # => "Hyahh!"