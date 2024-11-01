class Classroom
	def prepare(school_people)
		school_people.each do |person|
			puts person.prepare_for_class
		end
	end
end

class Teacher
	def prepare_for_class
		lesson_plan
	end

	def lesson_plan
		"Here are the lessons for class"
	end
end

class Student
	def prepare_for_class
		study
	end

	def study
		"I will study or the teacher will be mad"
	end
end

school_members = [Teacher.new, Student.new]
Classroom.new.prepare(school_members)