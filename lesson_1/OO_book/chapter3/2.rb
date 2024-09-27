class MyCar
  attr_accessor :color, :model
  attr_reader :speed, :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def to_s
    "Hey there! Here is your car: #{self.year}, #{self.color}, #{self.model} "
  end
end

ford = MyCar.new(2014, 'black', 'Ford')

puts ford