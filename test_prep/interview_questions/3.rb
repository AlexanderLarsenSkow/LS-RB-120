# I'm not sure how to do this one.
# I'm reasonably sure that somehow `ana` and `gilles` are meant to be the same object, but I don't see how.
# Is there a way to make it so we can only have one instance of a class, and they share instances?

class Human  # Problem received from Raul Romero
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def equal?(other)
    name == other.name
  end

  def +(other)
    self.name + other.name
  end
end

gilles = Human.new("gilles")
anna = Human.new("anna")

puts anna.equal?(gilles) #should output true #
puts (anna + gilles) # should output annagilles