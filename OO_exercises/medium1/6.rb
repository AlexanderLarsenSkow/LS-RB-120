# Number Guessing 1
class Player
  attr_accessor :guess

  def guess_number
    choice = ''

    loop do
      puts "Enter a number between 1 and 100:"
      choice = gets.chomp.to_i

      break if (1..100).include?(choice)
      puts "Invalid guess. Enter a number between 1 and 100."
    end
    self.guess = choice
  end
end


class GuessingGame
  attr_accessor :guesses
  attr_reader :numbers, :the_number, :player

  def display_number_guesses
    puts "You have #{guesses} guesses remaining."
  end

  def set_state
    @guesses = 7
    @numbers = (1..100).to_a
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

  def play
    set_state

    while guesses > 0 && player_not_right?
      display_number_guesses
      player.guess_number
      react
    end
    display_loss if player_not_right?
  end
end

new_game = GuessingGame.new

games = [new_game] * 5

games.each { |game| game.play }