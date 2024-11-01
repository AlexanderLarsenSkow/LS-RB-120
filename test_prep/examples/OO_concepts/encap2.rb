class Mummy
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

imotep = Mummy.new("Imotep")
tut = Mummy.new("King Tut")

p imotep.name # => "Imotep"
p tut.name # => "King Tut"

