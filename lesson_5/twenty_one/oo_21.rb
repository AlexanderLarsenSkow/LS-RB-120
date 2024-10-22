class Deck
  CARDS = ['2', '3', '4', '5', '6', '7', '8', '9',
          '10', 'J', 'Q', 'K', 'A']

  SUITS = ["♠", "♣", "♦", "♥"]

  attr_reader :cards

  def create_deck
    deck = []

    CARDS.each do |card|
      SUITS.each do |suit|
        deck << Card.new("#{card} of #{suit}")
      end
    end
    deck
  end

  def initialize
    @cards = create_deck
  end

  def deal_one(player)
    player.cards << cards.shuffle[0]
    cards.reject! { |card| player.cards.include?(card) }
  end

  def initial_deal(player)
    2.times { |_| deal_one(player) }
  end
end

class Card
  attr_reader :face_value, :point_value

  def calculate_point_value
    case
    when ('2'..'10').include?(face_value[0]) then face_value.to_i
    when ['J', 'Q', 'K'].include?(face_value[0]) then 10
    when 'A' then 11
    end
  end

  def initialize(face_value)
    @face_value = face_value
    @point_value = calculate_point_value
  end

  def to_s
    face_value
  end

  private

  attr_writer :point_value # change Ace value with this.
end

class CardPlayer
  attr_reader :name, :cards, :points

  def initialize
    @cards = []
    @points = 0
  end

  def display_cards
    cards.each do |card|
      puts "You have the #{card}"
    end
  end
end

class Human < CardPlayer

end

class Dealer < CardPlayer

end

class TwentyOneGame
  attr_reader :deck, :human, :dealer

  def initialize
    @deck = Deck.new
    @human = Human.new
    @dealer = Dealer.new
  end

  def deal_cards
    [dealer, human].each do |player|
      deck.initial_deal(player)
    end
  end

  def display_human_cards
    puts "You have #{human.cards}"
  end

  def display_one_dealer_card
    puts "The dealer shows the #{dealer.cards[0]}! and an unknown card."
  end

  def show_cards
    human.display_cards
    display_one_dealer_card
  end

  def play
    deal_cards
    show_cards

  end
end

TwentyOneGame.new.play