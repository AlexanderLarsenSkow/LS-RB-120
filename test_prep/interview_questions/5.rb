# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 
  
# class Monster
#   def attack
#     "attacks!"
#   end
# end

# class Barbarian < Monster
  
# end

# Duck Typing

# class Monster
#   def attack
#     "Use tentacles"
#   end
# end

# class Barbarian
#   def attack
#     "Swing an axe"
#   end
# end

# Module

module Attackable
  def attack
    "Charge!"
  end
end

class Monster
  include Attackable
end

class Barbarian
  include Attackable
end