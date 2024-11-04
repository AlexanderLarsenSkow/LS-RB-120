module Flightable
  def fly
    "I am #{name}. I am a #{self.class} and I can #{ability}."
  end
end

class Superhero
  include Flightable

  attr_accessor :ability, :name

  def self.fight_crime
    puts "I am #{self}!"
    announce_ability
  end

  def initialize(name, ability)
    @name = name
    @ability = Ability.new(ability)
  end

  def self.announce_ability
    puts "I fight crime with my #{@ability} ability!"
  end
end

class LSMan < Superhero
  @ability = "coding skills"
end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def to_s
    description
  end
end

superman = Superhero.new('Superman', 'fly')

p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime
# => I am LSMan!
# => I fight crime with my coding skills ability!