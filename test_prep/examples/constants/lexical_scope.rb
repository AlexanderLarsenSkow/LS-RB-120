ATTITUDE = 'neutral'

class Monster
  ATTITUDE = 'evil'
end

class Vampire < Monster
end

class Nosferatu < Vampire
  def get_attitude
    ATTITUDE
  end
end

p Nosferatu.new.get_attitude # => "evil"
# get_attitiude only returns `neutral` if we remove `Monster::ATTITUDE`.