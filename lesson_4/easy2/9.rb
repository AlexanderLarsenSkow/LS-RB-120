# What would happen if we added a play method to the Bingo class, 
# keeping in mind that there is already a method of this name in the Game 
# class that the Bingo class inherits from.

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
  
  def play
    "We already started!"
  end
end


# Adding a `play` method in the `Bingo` class, when `Game` already has a defined `play` method, overrides the `play` method inside
# `Game` when we call it on a `Bingo` object. In effect, `Bingo.new.play` will always return the string `'We already started!''
# so long as the play definition stays the same. It will not return `'Start the Game!'` because that method is overridden in the 
# method lookup path.





'

