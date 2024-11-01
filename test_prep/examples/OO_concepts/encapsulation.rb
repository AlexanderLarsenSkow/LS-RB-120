class Vampire
  def suck_blood
    "Delicious"
  end
end

class VampireHunter
  def search
    "There's gotta be a vampire around here..."
  end
end

dracula = Vampire.new
van_helsing = VampireHunter.new

p dracula.suck_blood
p van_helsing.search

p dracula.search # => NoMethodError
p van_helsing.suck_blood # => NoMethodError