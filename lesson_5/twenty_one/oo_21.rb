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
  def get_name
    name = ''

    loop do
      name = gets.chomp.strip.capitalize

      break unless name == ''
      puts "Enter a name silly!"
    end
    name
  end

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

  def yes_or_no
    choice = ''

    loop do
      choice = gets.chomp.downcase.delete(' ')

      break if choice.start_with?('y') || choice.start_with?('n')
      puts "Enter y / n"
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

  def reset
    initialize
  end

  def deal_one!(player)
    player.cards << cards.shuffle[0]
    cards.reject! { |card| player.cards.include?(card) }
    player.calculate_points
  end

  def initial_deal!(player)
    2.times { |_| deal_one!(player) }
  end

  private

  attr_writer :cards
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

class CardPlayer
  TOP_VALUE = 21
  STAY_VALUE = 17

  attr_reader :cards, :points
  attr_accessor :name

  include Readable
  include MathCapable

  def initialize
    @cards = []
    @points = 0
  end

  def reset
    initialize
  end

  def set_name
    self.name = "Player"
  end

  def busted?
    points > TOP_VALUE
  end

  def take_turn!(deck)
    loop do
      break if busted?

      if points < STAY_VALUE
      deck.deal_one!(self)
      display_cards
      display_points

      else
        break
      end
    end
  end

  private

  attr_writer :points
end

module HumanDisplays
  def display_name_question
    system "clear"
    puts "What's your name?"
  end

  def display_name_reaction
    puts "Welcome to Twenty One, #{name}!"
    sleep 2
  end

  def display_cards
    system "clear"
    puts "You have the #{join_and(cards)}!"
    sleep 1.5
  end

  def display_points
    puts "You're at #{points}!"
    sleep 1.5
  end

  def display_bust
    puts "Oof! You busted bro!"
  end
end

class Human < CardPlayer
  include HumanDisplays
  include Validation

  def set_name
    display_name_question
    self.name = get_name
    display_name_reaction
  end

  def take_turn!(deck)
    loop do
      if busted?
        display_bust
        return
      end

      choice = hit_or_stay

      if choice.start_with?('s')
        break

      elsif choice.start_with?('h')
        deck.deal_one!(self)
        display_cards
        display_points
      end
    end
  end
end

module DealerDisplays
  def display_one_card
    puts "The dealer shows the #{cards[1]} and an unknown card!"
    sleep 1.5
  end

  def display_cards
    puts "The dealer shows the #{join_and(cards)}!"
    sleep 1.5
  end

  def display_points
    puts "The dealer has #{points}!"
  end

  def display_bust
    puts "The dealer busted! Whoo!"
  end
end

class Dealer < CardPlayer
  include DealerDisplays

  def set_name
    self.name = "The Dealer"
  end
end

module GameDisplays
  def display_welcome
    puts "Welcome to Twenty One!"
    sleep 2
  end

  def display_human_win
    system "clear"
    puts "You won this round!"
  end

  def display_dealer_win
    system "clear"
    puts "The dealer beat you this time!"
  end

  def display_play_again_question
    puts "Do you want to play again?"
  end
end

class TwentyOneGame
  attr_reader :deck, :human, :dealer

  include GameDisplays
  include Validation

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
    human.display_points
    dealer.display_one_card
  end

  def determine_winner
    if human.points > dealer.points && !human.busted?
      display_human_win

    else
      display_dealer_win
    end
  end

  def play_again?
    display_play_again_question

    choice = yes_or_no
    choice.start_with?('y')
  end

  def new_hand
    [human, dealer, deck].each do |game_object|
      game_object.reset
    end
  end

  def play
    display_welcome
    human.set_name

    loop do
      new_hand

      deal_cards
      show_cards

      human.take_turn!(deck)
      dealer.take_turn!(deck)

      determine_winner
      break unless play_again?
    end
  end
end

TwentyOneGame.new.play

# p Card.new('7').point_value