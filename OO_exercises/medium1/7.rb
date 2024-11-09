# Highest and Lowest Ranking Cards

class Card
  include Comparable
  attr_reader :rank, :suit

  RANKS = {
    'A' => ['K', 'Q', 'J'] + ('1'..'10').to_a,
    'K' => ['Q', 'J', '10'] + ('1'..'10').to_a,
    'Q' => ['J', '10'] + ('1'..'10').to_a,
    'J' => [] + ('1'..'10').to_a
  }

  def determine_value(rank, other)
    RANKS.each do |face_card, lower_cards|
      if rank[0].to_s == face_card && lower_cards.include?(other.rank[0].to_s)
        return 1

      else
        return -1
      end
    end
  end

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    if rank.class == Integer && other.rank.class == Integer
      self.rank <=> other.rank

    else
      determine_value(rank, other)
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def ==(other)
    rank == other.rank && suit == other.suit
  end
end

p Card::RANKS

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8