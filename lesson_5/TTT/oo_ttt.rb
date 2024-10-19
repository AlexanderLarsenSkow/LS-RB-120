class Board
  INITIAL_MARKER = ' '
  X_MARKER = 'X'
  O_MARKER = 'O'

  attr_reader :squares

  def initialize
    @squares = {}
    (1..9).each do |key|
      squares[key] = Square.new(INITIAL_MARKER)
    end
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
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    marker
  end

  def update_marker(new_mark)
    self.marker = new_mark
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

  def move
    choice = nil
    puts "Choose a square between 1-9."

    loop do
      choice = gets.chomp.to_i

      break if (1..9).include?(choice)
      puts "Bad choice."
    end
    choice
  end
end

class Computer < Player
  def move(board)
    move = nil

    loop do
      move = (1..9).to_a.sample
      break if board.squares[move] == Board::INITIAL_MARKER
    end
    move
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
    @human = Human.new(Board::X_MARKER)
    @computer = Computer.new(Board::O_MARKER)
  end

  def execute_moves
    human_move = human.move
    computer_move = computer.move(board)

    board.set_square_at(human, human_move)
    board.set_square_at(computer, computer_move)
  end

  def play
  display_welcome_message

    loop do
      display_board
      execute_moves
      # display_board
      # break

      # human.move
      # break if someone_won? || board_full?

      # computer.move
      # break if someone_won? || board_full?
    end

  # display_result
  display_goodbye_message
  end
end

TTTGame.new.play