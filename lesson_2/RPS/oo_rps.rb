class Move
  attr_reader :value

  CHOICES = {
  's' => 'Scissors',
  'r' => 'Rock',
  'p' => 'Paper'
}

  def self.choices
    CHOICES.values
  end

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
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = Score.new
  end

  def to_s
    name
  end

  def display_score(other_player)
    sleep 1.4
    system "clear"
    puts "#{self}: #{score} | #{other_player}: #{other_player.score}"
  end

  def won?
    score == Score::SCORE_TO_WIN
  end

end

class Human < Player
  def set_name
    name = ''

    loop do
      puts "What's your name?"
      name = gets.chomp.capitalize

      break unless name == ''
      puts "Enter your name!"
    end

    system "clear"
    puts "It's nice to meet you, #{name}!"

    self.name = name
  end

  def convert(input)
    choices = Move::CHOICES

    choices.each do |abbrev, choice|
      return choice if input.downcase == abbrev || input.capitalize == choice
    end

    ''
  end

  def choose
    choice = nil

    loop do
      puts "Please choose Rock, Paper, or Scissors."
      choice = convert(gets.chomp)

      break if Move.choices.include? choice
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
    self.move = Move.new(Move.choices.sample)
  end
end

class Score
  attr_accessor :points

  SCORE_TO_WIN = 3

  def initialize
    @points = 0
  end

  def gain_point
    self.points += 1
  end

  def to_s
    points.to_s
  end

  def ==(other_score)
    points == other_score
  end

  def >(other_score)
    points > other_score.points
  end

  def <(other_score)
    points < other_score.points
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
    sleep 2
    system "clear"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_moves
    puts "You chose #{human.move}."
    sleep 1
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    sleep 1
    if human.move > computer.move
      human.score.gain_point
      puts "You won!"

    elsif human.move < computer.move
      computer.score.gain_point
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
    choice.start_with?('Y')
  end

  def game_over?
    human.won? || computer.won?
  end

  def display_grand_winner
    if human.won?
      puts "Congratulations! You are the grand winner #{human.name}!"

    else
      puts "Oh no! #{computer.name} took the day. There he is now dancing and laughing at you!"

    end
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      human.display_score(computer)

      if game_over?
        display_grand_winner
        break
      end

      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSgame.new.play
