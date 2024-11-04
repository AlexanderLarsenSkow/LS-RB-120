class Fruit
	attr_reader :type

	def initialize(type)
		@type = type
	end

	def i_am
		puts "I am a #{type}!"
	end

	def self.i_am
		puts "I am a #{@type}!"
	end
end

banana = Fruit.new('banana')
banana.i_am # => "I am a banana!

Fruit.i_am # error
i_am # => error, only available to Fruit objects.