class Vampire
	def name
		@name
	end

	def name=(new_name)
		@name = new_name
	end

	def initialize(name)
		@name = name
	end
end

dracula = Vampire.new("Dracula")
p dracula.name # => "Dracula"

dracula.name = "Edward Cullen"
p dracula.name # => "Edward Cullen"