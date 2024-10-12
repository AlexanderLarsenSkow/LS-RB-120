class Move
  attr_accessor :value

  def to_s
    value
  end

  def scissors?
    self.class == Scissors
  end

  def rock?
    self.class == Rock
  end

  def paper?
    self.class == Paper
  end

  def spock?
    self.class == Spock
  end

  def lizard?
    self.class == Lizard
  end

  def gun?
    self.class == Gun
  end

end

class Rock < Move

  def initialize
    self.value = 'Rock'
  end

  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.paper? || other_move.spock? ||
      other_move.gun?
  end

end

class Scissors < Move

  def initialize
    self.value = 'Scissors'
  end

  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.rock? || other_move.spock? ||
      other_move.gun?
  end

end

class Paper < Move

  def initialize
    self.value = 'Paper'
  end

  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.scissors? || other_move.lizard? ||
      other_move.gun?
  end

end

class Spock < Move

  def initialize
    self.value = 'Spock'
  end

  def >(other_move)
    other_move.rock? || other_move.scissors?
  end

  def <(other_move)
    other_move.paper? || other_move.lizard? ||
      other_move.gun?
  end

end

class Lizard < Move

  def initialize
    self.value = 'Lizard'
  end

  def >(other_move)
    other_move.paper? || other_move.spock?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors? ||
      other_move.gun?
  end

end

class Gun < Move
  def initialize
    self.value = 'Gun'
  end

  def >(other_move)
    other_move.rock? || other_move.scissors? ||
      other_move.paper? || other_move.spock? ||
      other_move.lizard?
  end

  def <(other_move)
    false
  end

end

class MoveOptions

  CHOICES = {
    ['s', 'scissors'] => Scissors.new,
    ['r', 'rock'] => Rock.new,
    ['p', 'paper'] => Paper.new,
    ['sp', 'spock'] => Spock.new,
    ['l', 'lizard'] => Lizard.new
  }

  def self.choices
    CHOICES.values
  end

end

module UserValidation

  def validate_choice(input, choices)
    input = input.downcase.delete(' ')

    choices.each do |possible_inputs, choice|
      return choice if possible_inputs.include?(input)
    end

    ''
  end

  def capitalize_longer_names(name)
    name.strip.split.map(&:capitalize).join(' ')
  end

end

class Player
  attr_accessor :move, :name, :score, :round_score

  def initialize
    set_name
    @round_score = Score.new
    @score = Score.new
  end

  def to_s
    name
  end

  def display_score(player_score, other_player, other_player_score)
    sleep 1.4
    system "clear"
    puts "#{self}: #{player_score} | #{other_player}: #{other_player_score}"
  end

  def won_round?
    round_score == Score::SCORE_TO_WIN
  end

  def won?
    score == Score::SCORE_TO_WIN
  end

end

class Human < Player
  include UserValidation

  def set_name
    name = ''

    loop do
      puts "What's your name?"
      name = capitalize_longer_names(gets.chomp)

      break unless name == ''
      puts "Enter your name!"
    end

    system "clear"
    puts "It's nice to meet you, #{name}!"

    self.name = name
  end

  def pick_opponent
    choice = nil

    loop do
      puts "Choose your enemy: Wulfgar, or TheBrain."
      choice = validate_choice(gets.chomp, ComputerOptions::COMPUTERS)

      break if ComputerOptions.choices.include? choice
      puts "Error: Pick one of these two."
    end

    choice
  end

  def choose
    choice = nil

    loop do
      puts "Please choose Rock, Spock, Paper, Scissors, or Lizard."
      choice = validate_choice(gets.chomp, MoveOptions::CHOICES)

      break if MoveOptions.choices.include? choice
      puts "Error: choose Rock, Spock, Paper, Scissors, or Lizard."
    end

    self.move = choice
  end

end

class Computer < Player
  def set_name
    self.name = ['SmartBot', 'The Rockinator', 'Star Trek Fan'].sample
  end

  def choose
    self.move = MoveOptions.choices.sample
  end

  def turn_end_reaction(human)
    if self.move > human.move
      puts random_turn_win_display

    elsif self.move < human.move
      puts random_turn_loss_display

    else
      puts display_tie
    end

    sleep 1.4
  end

  def round_end_reaction
    if self.won_round?
      puts display_round_win

    else
      puts display_round_loss
    end
    sleep 3
  end

end

class SmartBot < Computer
  def set_name
    self.name = 'TheBrain'
  end

  def human_pattern?(move_history)
    move_history.any? { |move| move_history.count(move) > 1 }
  end

  def find_most_common_move(move_history)
    move_history.max_by { |move| move_history.count(move) }
  end

  def beat_human(human_move)
    MoveOptions.choices.shuffle.each do |move|
      return move if move > human_move
    end
  end

  def choose(human_move_history)
    last_move = human_move_history[-1]
    common_move = find_most_common_move(human_move_history)

    if human_move_history.size < 2
      super()

    elsif human_pattern?(human_move_history)
      self.move = beat_human(common_move)

    else
      self.move = beat_human(last_move)
    end
  end

end

class Barbarian < Computer
  def set_name
    self.name = 'Wulfgar'
  end

  def choose
    self.move = Rock.new
  end

  def speak
    puts "My rock will destroy you, challenger. Prepare to meet your doom."
    sleep 1.5
  end

  def random_turn_win_display
    reaction1 = "#{self} roars in triumph! #{move} is mighty."
    reaction2 = "#{self} flashes you a sly grin."
    reaction3 = "#{self} pumps his fist in the air."

    [reaction1, reaction2, reaction3].sample
  end

  def random_turn_loss_display
    reaction1 = "#{self} eyes you in defiance."
    reaction2 = "You can see the sweat running down #{self}'s brow."
    reaction3 = "#{self} makes a rude gesture at you. How incorrigible!"

    [reaction1, reaction2, reaction3].sample
  end

  def display_tie
    "#{self} taps his foot impatiently."
  end

  def display_round_loss
    "#{self} is speechless. Rock never loses."
  end

  def display_round_win
    "#{self} raises his rock in the air. Nothing can beat Rock!"
  end

end

class Barbarian2 < Barbarian
  def choose
    self.move = [Rock.new, Scissors.new, Paper.new].sample
  end

  def display_round_win
    "#{self} sings a battle song about his greatness!"
  end

  def display_round_loss
    "#{self} breathes in deep. He is about to unlock his full power."
  end

end

class BarbarianFinalStage < Barbarian2
  def choose
    self.move = MoveOptions.choices.sample
  end

  def display_round_win
    "#{self} drinks a gallon of mead to celebrate his victory!"
  end

  def display_round_loss
    "#{self} acknowledges you are the better warrior. Well done."
  end

end

class JamesBond < Computer
  def set_name
    self.name = 'James Bond'
  end

  def choose
    self.move = Gun.new
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

  def reset_points
    self.points = 0
  end

  def to_s
    points.to_s
  end

  def ==(other_score)
    points == other_score
  end

end

class History
  attr_reader :move_records, :human, :computer

  def initialize(human, computer)
    @move_records = {
      human: [],
      computer: []
    }

    @human = human
    @computer = computer
  end

  def add_moves(changing_comp)
    move_records[:human] << human.move
    move_records[:computer] << changing_comp.move
  end

  def display_human_moves
    move_records[:human].join(', ')
  end

  def display_computer_moves
    move_records[:computer].join(', ')
  end

  def to_s
    "#{human.name}'s moves: #{display_human_moves} | #{computer.name}'s moves: #{display_computer_moves}"
  end

end

class ComputerOptions

  COMPUTERS = {
    ['w', 'wulfgar'] => Barbarian.new,
    ['b', 'brain', 't', 'thebrain'] => SmartBot.new
  }

  def self.choices
    COMPUTERS.values
  end

end

module GameDisplay
  def display_welcome_message
    puts "Welcome to Rock Spock, Paper, Scissors, Lizard!"
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

  def display_turn_win(player)
    sleep 1
    puts "#{player} won!"
  end

  def display_tie
    sleep 1
    puts "You and #{computer.name} tied!"
  end

  def display_human_won_round
    puts "Nice! You won this round!"
  end

  def display_computer_won_round
    puts "Oh no! #{computer.name} won this round!"
  end

  def display_history_question
    puts "Do you want to see the move history? Y / N"
  end

  def display_play_again_question
    puts "Do you want to play again? Y / N"
  end

  def display_grand_winner
    system "clear"
    if human.won?
      puts "Congratulations! You are the grand winner #{human.name}!"

    else
      puts "Oh no! #{computer.name} took the day. There he is now dancing and laughing at you!"
    end
  end
  
end

module GameValidation
  def yes_or_no_validation
    choice = nil

    loop do
      choice = gets.chomp.upcase.strip

      break if choice.start_with?('Y') || choice.start_with?('N')
      puts "Error: Enter Y or N"
    end
    choice
  end

end

class RPSgame
  attr_accessor :human, :computer, :history

  include GameDisplay
  include GameValidation

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = human.pick_opponent
    @history = History.new(human, computer)
  end

  def execute_moves
    display_moves
    history.add_moves(computer)
  end

  def find_turn_winner
    if human.move > computer.move
      human.round_score.gain_point
      display_turn_win('You')

    elsif computer.move > human.move
      computer.round_score.gain_point
      display_turn_win(computer)

    else
      display_tie
    end
  end

  def finish_turn
    computer.turn_end_reaction(human)
    human.display_score(human.round_score, computer, computer.round_score)
  end

  def evolve_barbarian
    old_score = computer.score

    if computer.class == Barbarian
      self.computer = Barbarian2.new
      computer.score = old_score

    elsif computer.class == Barbarian2
      self.computer = BarbarianFinalStage.new
      computer.score = old_score
    end
  end

  def reset_points
    human.round_score.reset_points
    computer.round_score.reset_points
  end

  def start_new_round
    computer.round_end_reaction

    if human.won_round?
      display_human_won_round
      human.score.gain_point
      evolve_barbarian

    else
      display_computer_won_round
      computer.score.gain_point
    end

    reset_points
    human.display_score(human.score, computer, computer.score)
  end

  def round_over?
    human.won_round? || computer.won_round?
  end

  def game_over?
    human.won? || computer.won?
  end

  def display_history
    display_history_question
    choice = yes_or_no_validation

    system "clear"
    puts history if choice.start_with?('Y')
  end

  def play_again?
    display_play_again_question
    choice = yes_or_no_validation

    system "clear"
    choice.start_with?('Y')
  end

  def play
    loop do
      human.choose
      computer.choose#(history.move_records[:human])
      execute_moves
      find_turn_winner
      finish_turn

      start_new_round if round_over?

      if game_over?
        display_grand_winner
        break
      end

      display_history
      break unless play_again?
    end

    display_goodbye_message
  end

end

RPSgame.new.play
