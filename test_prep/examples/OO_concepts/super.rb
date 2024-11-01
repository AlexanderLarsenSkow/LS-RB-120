class Monster
	attr_reader :name

	def initialize(name)
		@name = name
	end
end

class Vampire < Monster
	attr_reader :age

	def initialize(name, age)
		super(name)
		@age = age
	end
end

dracula = Vampire.new("Dracula", 417)
p dracula.age # => 417
p dracula.name # => 'Dracula'