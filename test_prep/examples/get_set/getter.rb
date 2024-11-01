class Vampire
	def name
		@name
	end

	def initialize(name)
		@name = name
	end

	def introduce
		"Hello. I am #{name}."
	end
end

dracula = Vampire.new("Dracula")
p dracula.name # => "Dracula"
p dracula.introduce # => "Hello. I am Dracula."