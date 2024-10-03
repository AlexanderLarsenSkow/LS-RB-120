# Pet Shelter

#Get the following output:
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# Classes to include:
  # Pet
  # Owner
  # Shelter

  # Shelter
    # #adopt_should add a pet to a pets array for the owner
    # #print_adoptions
    # Shelter should include owners/pets hash
    # owners point to an array of animals

  # Owners
    # get an array of pets as an instance variable.
    # writer method that adds a pet in that we write.

  # Data Structures:
    # print_adoptions
    # hash where owners are the keys and pets are in an array of values
    # 'Pete' => ['cat', 'dog', 'frog']
    # 'John' => ['duck', 'snake']
    # iterate over each with the owner and pet.
    # On iteration 1: the owner gets printed but only one time.
    # Then we print all the pets.

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end

  def adopt(pet)
    pets << pet
  end
end

class Shelter
  attr_reader :adoptions

  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    owner.adopt(pet)
    if self.adoptions[owner] == nil
      self.adoptions[owner] = [pet]

    else
      self.adoptions[owner] << pet
    end
  end

  def print_adoptions
    owners = adoptions.keys

    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"

      adoptions[owner].each do |pet|
        puts "A #{pet.type} named #{pet.name}"
      end
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
