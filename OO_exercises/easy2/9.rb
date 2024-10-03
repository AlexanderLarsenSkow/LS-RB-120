# Nobility

# Some people are nobility and they need to strut, they don't walk.
# Make a new class Noble that takes a name and title
# They walk by strutting.




class Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    "#{self.name} #{self.gait} over."
  end
end


class Person < Mammal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def walk
    "#{title} #{name} #{gait} forward."
  end

  private 
  def gait
    "struts"
  end
end

class Cat < Mammal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Mammal
  private

  def gait
    "runs"
  end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"
puts byron.name
# => "Byron"
puts byron.title
# => "Lord"