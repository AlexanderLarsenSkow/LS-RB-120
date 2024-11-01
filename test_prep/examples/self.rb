class Vampire
  attr_accessor :name

  def self.describe
    "I am a #{self}."
  end

  def initialize(name)
    @name = name
  end

  def change_name(name)
    self.name = name
  end

  def describe
    "I am #{self}!"
  end
end

p Vampire.describe

vamp = Vampire.new("Dracula")

p vamp.name # => "Dracula"
vamp.change_name("Edward")

p vamp.name # => "Edward"

p vamp.describe