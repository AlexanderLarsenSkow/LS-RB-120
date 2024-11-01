class Dog
	def speak
		"Bark!"
	end
end

class Huskie < Dog; end

p Dog.new.speak # => "Bark!"
p Huskie.new.speak # => "Bark!