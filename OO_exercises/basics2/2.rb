# Hello Chloe!

# Add an instance method #rename that renames kitty when invoked.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    self.name = name
  end
end

kitty = Cat.new('Sophie')
p kitty.name # 'Sophie'
kitty.rename('Chloe')
p kitty.name == 'Chloe'