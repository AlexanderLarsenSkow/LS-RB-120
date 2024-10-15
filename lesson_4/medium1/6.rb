class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

# There is no difference between the way these two classes work. The only written difference is that 
# in show_template in the first class, it just uses `template` to access the getter method for `@template`.
# In the second Computer class, it uses `self.template`, which also accesses the getter method for this instance variable.
# In this case, `self` is unnecessary for the program to run. However, it might help a developer later on understand
# exactly what `template` is doing and what it is being called on: the current instantiated object from this class.

