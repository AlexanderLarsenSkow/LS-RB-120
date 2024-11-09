# Number Guessing 1
class Player
  attr_accessor :guess

  def guess_number(numbers)
    choice = ''

    loop do
      puts "Enter a number between #{numbers[0]} and #{numbers[-1]}:"
      choice = gets.chomp.to_i

      break if numbers.include?(choice)
      puts "Invalid guess. Enter a number between #{numbers[0]} and #{numbers[-1]}."
    end
    self.guess = choice
  end
end


class GuessingGame
  attr_accessor :guesses
  attr_reader :numbers, :the_number, :player, :low_num, :high_num

  def initialize(low_num, high_num)
    @low_num = low_num
    @high_num = high_num
  end

  def set_state
    @numbers = (low_num..high_num).to_a
    @guesses = Math.log2(high_num - low_num).to_i + 1
    @the_number = numbers.sample
    @player = Player.new
  end

  def react
    player_guess = player.guess
    self.guesses -= 1

    if player_guess < the_number
      puts "Your guess is too low."

    elsif player_guess > the_number
      puts "Your guess is too high."

    else
      puts "You won! #{player_guess} is the number!"
    end
  end

  def player_not_right?
    player.guess != the_number
  end

  def display_loss
    puts "You lost! The number was #{the_number}!"
  end

  def display_number_guesses
    puts "You have #{guesses} guesses remaining."
  end

  def play
    set_state

    while guesses > 0 && player_not_right?
      display_number_guesses
      player.guess_number(numbers)
      react
    end
    display_loss if player_not_right?
  end
end

GuessingGame.new(1, 1_000_000).play