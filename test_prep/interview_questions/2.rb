class Human
    attr_reader :name

  def initialize(name="Dylan")
    @name = name
  end

  def hair_colour(color)
    @@hair_color = color unless color.strip == ''
    puts "Hi, my name is #{name} and I have #{@@hair_color} hair."
  end

  def self.hair_colour(color)
    puts "Hi, my name is #{name} and I have #{@@hair_color} hair."
  end
end

puts Human.new("Jo").hair_colour("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")
# Should "Hi, my name is Dylan and I have blonde hair."