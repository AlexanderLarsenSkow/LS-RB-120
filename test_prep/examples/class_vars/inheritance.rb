class Character
  @@disposition = "neutral"

  def self.attitude
    @@disposition
  end
end

p Character.attitude # neutral

class Monster < Character
  @@disposition = "evil"
end

p Monster.attitude # evil
p Character.attitude # evil

class Hero < Character
  @@disposition = "good"
end

p Hero.attitude # good
p Monster.attitude # good
p Character.attitude # good