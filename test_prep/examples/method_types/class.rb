class Dog
	def self.speak
		"Bark!"
	end
end

p Dog.speak # => 'Bark!'
p Dog.new.speak # => NoMethodError