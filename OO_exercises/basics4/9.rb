# Calculated Age

# Multiply @age by 2 upon assignment. then multiply @age by 2 again when it is returned by the getter method.

class Person
  def age=(age)
    @age = age * 2
  end

  def age
    @age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age