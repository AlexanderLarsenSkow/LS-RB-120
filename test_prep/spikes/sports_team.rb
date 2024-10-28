# Design a Sports Team (Author Unknown...thank you!)

# - Include 4 players (attacker, midfielder, defender, goalkeeper)
# - All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
# - All players can run and shoot the ball.
# - Attacker should be able to lob the ball
# - Midfielder should be able to pass the ball
# - Defender should be able to block the ball
# - The referee has a whistle. He wears black and is able to run and whistle.

# Notes:
  # jersey is just a state that references a color or pattern.

  # run module because every class can do it.

  # player superclass
    # shoot
    # mix in run

  # 4 subclasses attacker mid etc
  #

  # referee not a apart of this chain
  # has whistle
  # wears black
  # runs
  # can blow whistle

  # - Include 4 players (attacker, midfielder, defender, goalkeeper)


  module Runnable
    def run
      "Go fast!"
    end
  end

  class Player
    include Runnable
    attr_reader :jersey

    def initialize
      @jersey = 'blue'
    end

    def shoot
      "Kick the ball!"
    end
  end

  class Attacker < Player
    def lob
      "Go long!"
    end
  end

  class Midfielder < Player
    def pass
      "Here you go!"
    end
  end

  class Defender < Player
    def block
      "No you don't!"
    end
  end

  class GoalKeeper < Player
    def initialize
      @jersey = 'white with blue stripes'
    end
  end


  class Whistle
    def blow
      "Screams in high pitch"
    end
  end

  class Referree
    include Runnable
    attr_reader :uniform, :whistle

    def initialize
      @uniform = 'black'
      @whistle = Whistle.new
    end

    def get_attention
      puts whistle.blow
    end
  end

  attacker = Attacker.new
  midfielder = Midfielder.new
  defender = Defender.new
  goalie = GoalKeeper.new
  ref = Referree.new

  team = [attacker, midfielder, defender, goalie]
  team.each do |player|
    puts player.run
  end

  puts ref.run

  puts attacker.shoot
  puts midfielder.pass
  puts defender.block
  puts goalie.jersey
  ref.get_attention