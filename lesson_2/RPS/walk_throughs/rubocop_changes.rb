class Move
  attr_reader :value

  VALUES = ['Rock', 'Paper', 'Scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    value == 'Scissors'
  end

  def rock?
    value == 'Rock'
  end

  def paper?
    value == 'Paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other.move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    name = ''

    loop do
      puts "What's your name?"
      name = gets.chomp

      break unless name == ''
      puts "Enter your name!"
    end

    puts "It's nice to meet you, #{name}!"

    self.name = name
  end

  def choose
    choice = nil

    loop do
      puts "Please choose Rock, Paper, or Scissors."
      choice = gets.chomp.capitalize

      break if Move::VALUES.include? choice
      puts "Error: choose Rock, Paper, or Scissors."
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['010101010-the-first', 'Rockinator2000', 'TheCruncher'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSgame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_moves
    puts "You chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "You won!"

    elsif human.move < computer.move
      puts "#{computer.name} won!"

    else
      puts "You and #{computer.name} tied!"
    end
  end

  def play_again?
    choice = ''

    loop do
      puts "Do you want to play again? Enter Y / N"
      choice = gets.chomp.upcase

      break if choice.start_with?('Y') || choice.start_with?('N')
      puts "Error."
    end

    system "clear"
    return true if choice.start_with?('Y')
    false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner

      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSgame.new.play
