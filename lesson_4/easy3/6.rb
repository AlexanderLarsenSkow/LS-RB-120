class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  # def make_one_year_older
  #   self.age += 1
  # end
  
  def make_one_year_older
    @age += 1
  end
end

# Don't write self in the `make_one_year_older` method.

