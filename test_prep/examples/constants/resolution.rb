class Monster
  def use_weapon
    self.class::WEAPON
  end
end

class Vampire < Monster
  WEAPON = 'Fangs'
end

class Mummy < Vampire
  WEAPON = 'sands'
end

p Vampire.new.use_weapon # => Uninitialized Constant error
p Mummy.new.use_weapon # => same ^