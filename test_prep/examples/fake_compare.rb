class AncientStructure
  include Comparable

  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def <=>(other)
    age <=> other.age
  end
end

angkor = AncientStructure.new("Angkor Wat", 900)
giza = AncientStructure.new("Great Pyramid of Giza", 4500)

p angkor == giza # => false
p giza > angkor # true