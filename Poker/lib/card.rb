class Card

  SUITS = [:diamonds, :hearts, :clubs, :spades]
  FACE_CARDS = {
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }

  attr_reader :value, :suit

  def initialize(value, suit)
    raise InvalidCardError unless value.between?(2,14) && SUITS.include?(suit)
    @value = value
    @suit = suit
  end

  def to_s
    if value > 10
      "#{FACE_CARDS[value]} of #{suit}"
    else
      "#{value} of #{suit}"
    end
  end

end


class InvalidCardError < StandardError
  def message
    "Not a card"
  end
end
