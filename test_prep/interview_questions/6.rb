# Without adding any methods below, implement a solution; originally by Natalie Thompson,
# this version by Oscar Cortes

class ClassA < Module
  attr_reader :field1, :field2

  def initialize(num)
    @field1 = "xyz" # string
    @field2 = num # integer argument
  end
end

class ClassB < Module
  attr_reader :field1

  def initialize
    @field1 = "abc" # string
  end
end

obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new


p obj1 > obj2
p obj2 > obj3