module Readable
  def joinor(choices_array, punctuation = ', ', delimiter = 'or')
    choices = choices_array.map do |number|
      if choices_array.last == number
        "#{delimiter} #{number}"

      elsif choices_array.size > 2
        "#{number}#{punctuation}"

      else
        "#{number} "
      end
    end
    choices.join
  end
end

class Board
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  attr_reader :squares

  def initialize
    @squares = {}
    (1..9).each do |key|
      squares[key] = Square.new
    end
  end

  def full?
    empty_squares.empty?
  end

  def odd_number_remaining?
    empty_squares.size.odd?
  end

  def three_identical_markers?(line)
    markers = line.map { |key| squares[key].marker }
    markers.uniq.size == 1 && !markers.include?(Square::INITIAL_MARKER)
  end

  def get_winning_marker(line)
    first_square = line[0]
    squares[first_square].marker
  end

  def available?(move)
    squares[move].unmarked?
  end

  def empty_squares
    squares.keys.select { |key| available?(key) }
  end

  def []=(move, new_marker)
    squares[move].update_marker(new_marker)
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts ""
    puts "      |         |"
    puts "  #{squares[1]}   |    #{squares[2]}    |  #{squares[3]}"
    puts "      |         |"
    puts "------+---------+------"
    puts "      |         |"
    puts "  #{squares[4]}   |    #{squares[5]}    |  #{squares[6]}"
    puts "      |         |"
    puts "------+---------+------"
    puts "      |         |"
    puts "  #{squares[7]}   |    #{squares[8]}    |  #{squares[9]}"
    puts "      |         |"
  end
  # rubocop:enable Metrics/AbcSize
end

class Square
  INITIAL_MARKER = ' '
  X_MARKER = 'X'
  O_MARKER = 'O'

  attr_reader :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    marker
  end

  def update_marker(new_mark)
    self.marker = new_mark
  end

  def unmarked?
    self == INITIAL_MARKER
  end

  def ==(some_value)
    marker == some_value
  end

  private

  attr_writer :marker
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Human < Player
  include Readable

  def move(board)
    choice = nil
    puts "Choose a square: (#{joinor(board.empty_squares)})"

    loop do
      choice = gets.chomp.to_i

      break if (1..9).include?(choice) && board.available?(choice)
      puts "Bad choice."
    end
    choice
  end
end

class Computer < Player
  def move(board)
    board.empty_squares.sample
  end
end

module GameDisplays
  def clear
    system "clear"
  end

  def display_welcome_message
    puts "Welcome to Tic_Tac_Toe!"
  end

  def display_goodbye_message
    clear
    puts "Thanks for playing!"
  end

  def display_board
    clear
    puts " You: #{human.marker}    |    Computer: #{computer.marker}"
    board.draw
  end

  def display_result
    case determine_winning_marker
    when human.marker then puts "You won!"
    when computer.marker then puts "Oh no! The computer won!"
    else
      puts "Uh-oh. You tied!"
    end
  end

  def display_play_again
    puts "Do you want to play again? Y / N"
  end
end

module GameValidation
  def yes_or_no
    choice = nil

    loop do
      choice = gets.chomp.upcase.delete(' ')

      break if choice.start_with?('Y') || choice.start_with?('N')
      puts "Error"
    end
    choice
  end
end

class TTTGame
  attr_accessor :board
  attr_reader :human, :computer

  include GameDisplays
  include GameValidation

  def initialize
    @human = Human.new(Square::X_MARKER)
    @computer = Computer.new(Square::O_MARKER)
  end

  def set_board
    self.board = Board.new
  end

  def someone_won?
    !!determine_winning_marker
  end

  def determine_winning_marker
    Board::WINNING_LINES.each do |line|
      if board.three_identical_markers?(line)
        return board.get_winning_marker(line)
      end
    end
    nil
  end

  def execute_alternating_moves
    if board.odd_number_remaining?
      human_move = human.move(board)
      board[human_move] = human.marker

    else
      computer_move = computer.move(board)
      board[computer_move] = computer.marker
    end
  end

  def play_round
    loop do
      execute_alternating_moves
      display_board
      break if someone_won? || board.full?
    end
  end

  def play_again?
    display_play_again
    yes_or_no.start_with?('Y')
  end

  def play
    display_welcome_message
    loop do
      set_board

      display_board
      play_round
      display_result

      break unless play_again?
    end
    display_goodbye_message
  end
end

TTTGame.new.play
