class Monster
	def prowl
		"Hiss"
	end
end

class Vampire < Monster; end

class Nosferatu < Vampire; end

p Nosferatu.new.prowl # => "Hiss"
p Nosferatu.ancestors # => [Nosferatu, Vampire, Monster, BasicObject, Kernel, Object]