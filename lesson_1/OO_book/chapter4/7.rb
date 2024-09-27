# Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade
# will raise an error. Create a better_grade_than? method, that you can call like so...

class Student
  attr_accessor :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    if grade > other.grade
      "Well done!"

    else
      "Uh-Oh!"
    end
  end

  protected

  attr_reader :grade
end

alejandro = Student.new('Alejandro', 94)
jacob = Student.new('Jacob', 84)

p alejandro.better_grade_than?(jacob)
p jacob.better_grade_than?(alejandro)