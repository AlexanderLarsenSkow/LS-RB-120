# Create two instances of the class with separate names and ages.

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

pauline = AngryCat.new(5, 'Pauline')
terry_crews = AngryCat.new(3, 'Terry Crews')

p pauline.age != terry_crews.age
p pauline.name != terry_crews.name