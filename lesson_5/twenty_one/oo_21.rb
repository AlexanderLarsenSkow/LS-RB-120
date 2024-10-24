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

module Validation
  def hit_or_stay
  puts "Do you want to hit or stay? Enter h / s "
    choice = ''

    loop do
      choice = gets.chomp.downcase.delete(' ')

      break if choice.start_with?('h') ||choice.start_with?('s')
      puts "Error: Enter one of the above."
    end
    choice
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
end

module MathCapable
  def get_total(card_points)
    card_points.sum
  end

  def determine_ace_value!(card_points)
    total = get_total(card_points)

    card_points.each_with_index do |point_value, index|
      break if total <= CardPlayer::TOP_VALUE
      card_points[index] = 1 if point_value == 11
    end
  end

  def calculate_points
    card_points = cards.map(&:point_value)

    if card_points.include?(11)
      determine_ace_value!(card_points)
    end

    self.points = get_total(card_points)
  end
end

module CardDisplays
  def display_cards
    if instance_of?(Human)
      puts "You have the #{join_and(cards)}!"

    else
      puts "The dealer shows the #{join_and(cards)}!"
    end
  end

  def display_points
    puts "You're at #{points}!"
  end
end

class CardPlayer
  TOP_VALUE = 21
  STAY_VALUE = 17

  attr_reader :name, :cards, :points

  include Readable
  include MathCapable
  include CardDisplays

  def initialize
    @cards = []
    @points = 0
  end

  def busted?
    points > TOP_VALUE
  end

  def take_turn!(deck)
    loop do
      break if busted?

      if points < STAY_VALUE
      deck.deal_one!(self)

      else
        break
      end
    end
  end

  private

  attr_writer :points
end

class Human < CardPlayer
  include Validation

  def take_turn!(deck)

    loop do
      case hit_or_stay
      when 'h'
        deck.deal_one!(self)
      else
        break
      end
    end
  end
end

module DealerDisplays
  def display_one_card
    puts "The dealer shows the #{cards[1]} and an unknown card!"
  end
end

class Dealer < CardPlayer
  include DealerDisplays
end

module GameDisplays; end

class TwentyOneGame
  attr_reader :deck, :human, :dealer

  include GameDisplays
  include Readable

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
    human.display_cards
    dealer.display_one_card
    human.display_points
  end

  def play
    deal_cards
    show_cards
    human.take_turn!(deck)
    dealer.take_turn!(deck)
    dealer.display_cards
    p human.points
    p dealer.points
  end
end

TwentyOneGame.new.play

# p Card.new('7').point_value