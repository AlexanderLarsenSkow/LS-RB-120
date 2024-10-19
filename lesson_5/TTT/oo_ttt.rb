class Board
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

  def available?(move)
    squares[move].unmarked?
  end

  def empty_squares
    squares.keys.select { |key| available?(key) }
  end

  def get_square_at(key)
    squares[key]
  end

  def set_square_at(player, move)
    new_marker = player.marker
    squares[move].update_marker(new_marker)
  end
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

  def move(board)
    choice = nil
    puts "Choose a square: (#{board.empty_squares.join(', ')})"

    loop do
      choice = gets.chomp.to_i

      break if board.available?(choice)
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
  def display_welcome_message
    puts "Welcome to Tic_Tac_Toe!"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_board
    system "clear"
    puts " You: #{human.marker}    |    Computer: #{computer.marker}"
    puts ""
    puts "      |         |"
    puts "  #{board.get_square_at(1)}   |    #{board.get_square_at(2)}    |  #{board.get_square_at(3)}"
    puts "      |         |"
    puts "------+---------+------"
    puts "      |         |"
    puts "  #{board.get_square_at(4)}   |    #{board.get_square_at(5)}    |  #{board.get_square_at(6)}"
    puts "      |         |"
    puts "------+---------+------"
    puts "      |         |"
    puts "  #{board.get_square_at(7)}   |    #{board.get_square_at(8)}    |  #{board.get_square_at(9)}"
    puts "      |         |"
    puts ""
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  include GameDisplays

  def initialize
    @board = Board.new
    @human = Human.new(Square::X_MARKER)
    @computer = Computer.new(Square::O_MARKER)
  end

  def execute_moves
    human_move = human.move(board)
    board.set_square_at(human, human_move)

    return if board.full?

    computer_move = computer.move(board)
    board.set_square_at(computer, computer_move)
  end

  def play
    display_welcome_message
    display_board

    loop do
      execute_moves
      display_board

      break if board.full?
      # break if someone_won? || board_full?
    end

  # display_result
  display_goodbye_message
  end
end

TTTGame.new.play