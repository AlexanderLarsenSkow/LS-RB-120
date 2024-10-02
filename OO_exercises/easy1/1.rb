# Input: message or string
# Output: of a banner around our string that covers the entire distance.

# Rules:
  # The banner should cover teh entire string
  # We have to use OO programming to create each line
  # Input always fits in the window.

# Examples:
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Data Structures:
  # Take the message and get the size + 2 for spaces. Then have the lines.
  # instance variable for message size

#   # class Banner
#   def initialize(message)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule # top / bottom
#   end

#   def empty_line # 2 in the middle with nothing except two lines
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# Algorithm:
  # initialize
  # Create an instance variable called size equal to hte message size + 2

  # Should be able to read size instance variable

  # horozontal rule:
    # + sign, - sign * size vairable, + sign

  # message_line
    # | + empty space * the size, + |

class Banner
  attr_reader :size

  def initialize(message)
    @message = message
    @size = message.size + 2
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+" + ("-" * size)  + "+"
  end

  def empty_line
    "|" + (' ' * size) + '|'
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner2 = Banner.new('I love pizza')
puts banner2