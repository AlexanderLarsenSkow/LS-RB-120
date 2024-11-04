# This example shows every polymorphism type in the same example.

module Lunchable
  def eat
    puts "Yummy"
  end
end

class Staff
  include Lunchable
  
  def supervise
    puts "Supervising the students"
  end
end

class Principal < Staff
end

class Teacher < Staff
  def prepare_for_class
    puts "Lesson Plan"
  end
end

class Student
  include Lunchable

  def prepare_for_class
    puts "Study"
  end
end

Principal.new.supervise
Teacher.new.supervise

school_members = [Principal.new, Teacher.new, Student.new]

school_members.each { |school_member| school_member.eat }

Teacher.new.prepare_for_class
Student.new.prepare_for_class

# polymorphism throuhg inheritance
# mix in
# duck typing