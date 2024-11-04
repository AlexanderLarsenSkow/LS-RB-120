class SuperHero
  def self.describe
    "I am a #{self}!"
  end

  def describe
    "I am #{self}!"
  end
  
  def fight_crime
    self.describe + " and I fight crime!"
  end
end

superman= SuperHero.new

p superman.describe # => instance method, "I am #<SuperHero:0x00007fed8ea28a18>!"
p SuperHero.describe # => class method, "I am a SuperHero!"

p superman.fight_crime
