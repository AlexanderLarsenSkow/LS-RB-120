# Choose Method

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    @name = set_name
  end

  def set_name
    name = ''

    if human?
      loop do
        puts "What's your name?"
        name = gets.chomp

        break unless name == ''
        puts "Enter your name!"
      end

      puts "It's nice to meet you, #{name}!"

    else
      name = ['010101010-the-first', 'Rockinator2000', 'TheCruncher'].sample
    end
    name
  end

  def human?
    @player_type == :human
  end

  def human_choice
    choice = nil

    loop do
      puts "Please choose Rock, Paper, or Scissors."
      choice = gets.chomp.capitalize

      break if ['Rock', 'Paper', 'Scissors'].include? choice
      puts "Error: choose Rock, Paper, or Scissors."
    end
    choice
  end

  def choose
    if human?
      self.move = human_choice
    else
      self.move = ['Rock', 'Paper', 'Scissors'].sample
    end
  end
end


# Game Orchestration Engine
class RPSgame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_winner
    puts "You chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'Rock'
      puts "It's a tie!" if computer.move == 'Rock'
      puts "You won!" if computer.move == 'Scissors'
      puts "You lose!" if computer.move == 'Paper'

    when 'Paper'
      puts "It's a tie!" if computer.move == 'Paper'
      puts "You won!" if computer.move == 'Rock'
      puts "You lose!" if computer.move == 'Scissors'

    when 'Scissors'
      puts "It's a tie!" if computer.move == 'Scissors'
      puts "You won!" if computer.move == 'Paper'
      puts "You lose!" if computer.move == 'Rock'
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
      display_winner

      break unless play_again?
    end

    display_goodbye_message
  end
end


game = RPSgame.new
game.play