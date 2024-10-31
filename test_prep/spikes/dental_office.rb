# Dental Office - Dental People Inc
  # All DENTISTS - graduated from dental school
# 2 oral surgeons
  # place implants
# 2 orthodontists
  # cannot pull teeth
  # straighten teeth

# 1 general specialist
  # fill teeth

module Pullable
  def pull_teeth
    puts "Just gotta yank it outta there..."
    sleep 1
  end
end

class Dentist
  attr_reader :school

  def initialize(school)
    @school = school
  end

  def shamelessly_self_promote
    puts "Did you know I went to #{school}?"
    sleep 1
  end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implants
    puts "This is only going to hurt a lot..."
    sleep 1
  end
end

class Orthodontist < Dentist
  def straighten_teeth
    puts "I can't wait for all that braces money."
    sleep 1
  end
end

class GeneralSpecialist < Dentist
  include Pullable

  def fill_teeth
    puts "This is what happens when you don't brush, muchacho."
    sleep 1
  end
end

class DentalOfficeInc
  attr_reader :ortho1, :ortho2, :surgeon1, :surgeon2, :general_spec, :doctors

  def initialize
    @ortho1 = Orthodontist.new("Harvard")
    @ortho2 = Orthodontist.new("Columbia")
    @surgeon1 = OralSurgeon.new("UCLA")
    @surgeon2 = OralSurgeon.new("UW")
    @general_spec = GeneralSpecialist.new("Tokyo Medical")
    @doctors = [ortho1, ortho2, surgeon1, surgeon2, general_spec]
  end

  def a_normal_day
     ortho1.shamelessly_self_promote
     ortho2.straighten_teeth
     ortho1.shamelessly_self_promote
     ortho2.shamelessly_self_promote
     surgeon1.place_implants
     surgeon1.pull_teeth
     general_spec.fill_teeth
     surgeon2.shamelessly_self_promote

    doctors.each do |doctor|
      doctor.shamelessly_self_promote
    end
  end
end

DentalOfficeInc.new.a_normal_day