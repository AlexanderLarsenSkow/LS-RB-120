module Readable
  def join_and(cards, punctuation = ', ', delimiter = 'and')
    card_faces = cards.map do |card|
      if card == cards.last
        "#{delimiter} #{card}"

      elsif cards.size == 2
        "#{card} "

      else
        "#{card}#{punctuation}"
      end
    end
    card_faces.join
  end
end

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

  def deal_one!(player)
    player.cards << cards.shuffle[0]
    cards.reject! { |card| player.cards.include?(card) }
    player.calculate_points
  end

  def initial_deal!(player)
    2.times { |_| deal_one!(player) }
  end
end

class Card
  attr_reader :face_value, :point_value

  def calculate_point_value
    if ('2'..'9').include?(face_value[0])
      face_value.to_i

    elsif ['10', 'J', 'Q', 'K'].any? { |face| face_value.include?(face) }
      10

    elsif face_value.include?('A')
      11
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

  include Readable

  def initialize
    @cards = []
    @points = 0
  end

  def calculate_points
    total = 0

    cards.each do |card|
      total += card.point_value
    end

    self.points = total
  end

  private

  attr_writer :points
end

class Human < CardPlayer

end

class Dealer < CardPlayer

end

module GameDisplays
  def display_human_cards
    puts "You have the #{human.join_and(human.cards)}"
  end

  def display_one_dealer_card
    puts "The dealer shows the #{dealer.cards[0]} and an unknown card!"
  end
end

class TwentyOneGame
  attr_reader :deck, :human, :dealer

  include GameDisplays

  def initialize
    @deck = Deck.new
    @human = Human.new
    @dealer = Dealer.new
  end

  def deal_cards
    [dealer, human].each do |player|
      deck.initial_deal!(player)
    end
  end

  def show_cards
    display_human_cards
    display_one_dealer_card
  end

  def play
    deal_cards
    # deck.deal_one!(human)
    show_cards
    # human.calculate_points
    p human.points
    p dealer.points

    # deck.deal_one!(human)
    # human.calculate_points
    # display_human_cards
    # p human.points

  end
end

TwentyOneGame.new.play

# p Card.new('7').point_value