# Class Variables and Class Methods

class Fruit
	@@number = 0
	
	def initialize(type)
		@@number += 1
	end
	
	def self.number
		"There are #{@@number} of us!"
	end
end

banana = Fruit.new('banana')
puts Fruit.number # => "There are 1 of us!"

apple = Fruit.new('apple')
puts Fruit.number # => "There are 2 of us!"