module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters

  def initialize(name)
    #
    self.name = name #
    @characters = []
  end

  def display
    name # nil
  end

  protected
  attr_reader :name
  attr_writer :name
end

class Monster < Characters
  include Attackable

  def initialize(name)
    super
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self) #
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb')
rob = Monster.new('monst') # Argument Error
conan.characters << rob # fine
p conan.display # nil

# display returns the name getter method for the @name instance variable
# However, @name is never initialized so it doesn't actually do anything. The fix here is to
# write self.name = name