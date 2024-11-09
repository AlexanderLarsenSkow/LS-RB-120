# Students

# Graduate students can use on-campusparking, unders can't
# grad and unders have a name and a year

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    @parking = parking
    super(name, year)
  end
end

class Undergraduate < Student
end


