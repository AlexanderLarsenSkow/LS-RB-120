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
    other_move.paper? || other_move.spock?
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
    other_move.rock? || other_move.spock?
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
    other_move.scissors? || other_move.lizard?
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
    other_move.paper? || other_move.lizard?
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
    other_move.rock? || other_move.scissors?
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
    system "clear"
    choice = nil

    loop do
      puts "Choose your enemy: Wulfgar or SmartBot."
      choice = validate_choice(gets.chomp, ComputerOptions::COMPUTERS)

      break if ComputerOptions.choices.include? choice
      puts "Error: Pick one of these two."
    end

    choice
  end

  def choose
    system "clear"
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

  def introduce
    sleep 4
  end

end

module SmartBotDisplay
  def random_turn_win_display
    reaction1 = "Beepboop boopbeep!"
    reaction2 = "#{self} boops in self-satisfaction."
    reaction3 = "#{self} does a small victory spin."

    [reaction1, reaction2, reaction3].sample
  end

  def random_turn_loss_display
    reaction1 = "ooooooooooooooo."
    reaction2 = "#{self} boops in anger."
    reaction3 = "#{self} looks like he's about to self-destruct."

    [reaction1, reaction2, reaction3].sample
  end

  def display_tie
    "#{self} boops in anticipation."
  end

  def display_round_win
    "#{self} starts playing the theme song to Space Jam."
  end

  def display_round_loss
    "#{self} wonders where he went wrong."
  end

  def introduce
    puts "A cute robot rolls up to greet you. BEEPBOOP-you're-going-down."
    super
  end

end

class SmartBot < Computer
  include SmartBotDisplay

  def set_name
    self.name = 'SmartBot'
  end

  def human_pattern?(move_history)
    move_history.any? { |move| move_history.count(move) > 1 }
  end

  def find_most_common_move(move_history)
    move_history = move_history[-7..-1] if move_history.size > 7
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

module BarbarianDisplay
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

  def introduce
    puts "A giant man with scraggly brown hair and a massive rock approaches."
    sleep 2
    puts "'May the Rock Gods grant me victory!'"
    super
  end

end

class Barbarian < Computer
  include BarbarianDisplay

  def set_name
    self.name = 'Wulfgar'
  end

  def choose
    self.move = Rock.new
  end

end

module Barbarian2Display

  def display_round_win
    "#{self} sings a battle song about his greatness!"
  end

  def display_round_loss
    "#{self} breathes in deep. He is about to unlock his full power."
  end

end

class Barbarian2 < Barbarian
  include Barbarian2Display

  def choose
    self.move = [Rock.new, Scissors.new, Paper.new].sample
  end

end

module FinalBarbarianDisplay

  def display_round_win
    "#{self} drinks a gallon of mead to celebrate his victory!"
  end

  def display_round_loss
    "#{self} acknowledges you are the better warrior. Well done."
  end

end

class FinalBarbarian < Barbarian2
  include FinalBarbarianDisplay

  def choose
    self.move = MoveOptions.choices.sample
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

  def get_moves(player)
    moves_list = move_records[player]

    if moves_list.size > 7
      moves_list[-7..-1].join(', ')

    else
      moves_list.join(', ')
    end
  end

  def to_s
    h_moves = get_moves(:human)
    c_moves = get_moves(:computer)

    "#{human}'s moves: #{h_moves} | #{computer}'s moves: #{c_moves}"
  end

end

class ComputerOptions

  COMPUTERS = {
    ['w', 'wulfgar'] => Barbarian.new,
    ['s', 'smartbot'] => SmartBot.new
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

  def display_rules
    system "clear"
    puts <<~RULES
      The game is simple! It's just like Rock, Paper, Scissors with some
      extra moves. In this version, you can choose what computer you will
      play against. Be warned, they all have their own personalities and will
      act in different ways. Play is made up of rounds. Win 3 times and you
      win the round. Win 3 rounds and you win the game.
    RULES
    puts ""
  end

  def display_moves_rules
    sleep 8

    puts "                          These are the Moves:"
    puts ""
    sleep 1.7

    puts"   Rock beats Scissors and Lizard.     Paper beats Rock and Spock."
    puts ""
    sleep 1.7

    puts"   Scissors beats Paper and Lizard.    Lizard beats Spock and Paper."

    puts ""
    sleep 1.7
    puts "                       Spock beats Rock and Lizard.              "
    puts ""

    sleep 1.7
  end

  def explain_game
    display_rules
    display_moves_rules
  end

  def display_moves
    puts "You chose #{human.move}."
    sleep 1
    puts "#{computer} chose #{computer.move}."
  end

  def display_turn_win(player)
    sleep 1
    puts "#{player} won!"
  end

  def display_tie
    sleep 1
    puts "You and #{computer} tied!"
  end

  def display_human_won_round
    puts "Nice! You won this round!"
  end

  def display_computer_won_round
    puts "Oh no! #{computer} won this round!"
  end

  def display_rules_question
    puts "Do you want to see the rules?"
  end

  def display_ready_or_not
    puts "Alright! Ready to play?"
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
      puts "Congratulations! You are the grand winner #{human}!"

    else
      puts "Oh no! #{computer} won the game! There he is now celebrating!"
    end
  end

end

module GameValidation
  def yes_or_no_validation(number_of_options)
    choice = nil

    loop do
      choice = gets.chomp.upcase.strip

      if number_of_options == 1
        break if choice.start_with?('Y')
          puts "Enter Y if you're ready!"


      else
        break if choice.start_with?('Y') || choice.start_with?('N')
        puts "Error: Enter Y or N"

      end
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
    explain_game if see_rules?

    @computer = human.pick_opponent if ready_to_play?
    @history = History.new(human, computer)
    computer.introduce
  end

  def see_rules?
    display_rules_question
    choice = yes_or_no_validation(2)

    choice.start_with?('Y')
  end

  def ready_to_play?
    display_ready_or_not
    choice = yes_or_no_validation(1)

    choice.start_with?('Y')
  end

  def computer_choice
    if computer.class == SmartBot
      computer.choose(history.move_records[:human])

    else
      computer.choose
    end
  end

  def execute_moves
    display_moves
    history.add_moves(computer)
  end

  def add_point(player, type)
    if type == :round
      player.round_score.gain_point

    else
      player.score.gain_point
    end
  end

  def find_turn_winner
    if human.move > computer.move
      add_point(human, :round)
      display_turn_win('You')

    elsif computer.move > human.move
      add_point(computer, :round)
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
      self.computer = FinalBarbarian.new
      computer.score = old_score
    end
  end

  def reset_points
    human.round_score.reset_points
    computer.round_score.reset_points
  end

  def start_new_round

    if human.won_round?
      display_human_won_round
      add_point(human, :main)
      evolve_barbarian

    else
      display_computer_won_round
      add_point(computer, :main)
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
    choice = yes_or_no_validation(2)

    system "clear"
    puts history if choice.start_with?('Y')
  end

  def play_again?
    display_play_again_question
    choice = yes_or_no_validation(2)

    system "clear"
    choice.start_with?('Y')
  end

  def play
    loop do
      human.choose
      computer_choice
      execute_moves
      find_turn_winner
      finish_turn

      if round_over?
        computer.round_end_reaction
        start_new_round
      end

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
