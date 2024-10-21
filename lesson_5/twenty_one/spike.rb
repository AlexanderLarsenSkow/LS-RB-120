class Deck
  # initializing 52 cards with their face values. Card class will determine point value based on face_value.
end

class Card
  # has some value from 1 - 10 and Ace
  # needs 2 values: a face value (king, Ace, 10, etc)
  # card_value: 1 - 11
  # get 52 cards for the Deck. So we need to uh, pass in a face value then get the real value from that.
  
  # Card Responsibility: caluclate point_value after getting the face value, which is given from Deck during initialization.
end

# Participant Superclass? to deal with dealer and Player

class Player
  # They can hit or stay
  # Hitting ove 21 means they bust.
  # initialize with bust = false
  # bust = true if over 21?
  # busted? => bust == true
  
  # calculate_total will be their resonsibility
  # module CardMath: calculates total for you.
end

# Consider a mix in if this gets complicated with inheritance.

class Dealer
  # might subclass it from Player and make a Human subclass as well.
  # could be fun to get an AI who also plays against dealer: computer subclass.
  # They can hit or stay
  # They also go to 21... fack.
end

class TwentyOneGame
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end
  
  def play
    display_welcome
    
    loop do
      deal_cards
      show_cards
      player_turn
      dealer_turn
      determine_winner # show_result
      reshuffle_cards
      
      break unless play_again?
    end
    
    display_goodbye
  end
end

TwentyOneGame.new