# Modify this class so both flip_switch and the setter method switch= are private methods

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_status
    puts "The switch is #{switch}!"
  end

  private

  def flip_switch(desired_state)
    self.switch = desired_state
  end

  attr_accessor :switch
end

a = Machine.new

a.start
a.stop
a.switch_status
a.start
a.switch_status