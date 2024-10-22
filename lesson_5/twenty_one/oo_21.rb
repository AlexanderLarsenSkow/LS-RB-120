class Deck
  CARDS = ['1', '2', '3', '4', '5', '6', '7', '8', '9',
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
end

class Card
  attr_reader :face_value, :point_value

  def calculate_point_value
    case face_value[0]
    when ('1'..'10') then face_value.to_i
    when ('J'..'Q') then 10
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

# puts Deck.new.cards

c = Card.new('K of Hearts')

p c.point_value