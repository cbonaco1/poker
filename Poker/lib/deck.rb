require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = Array.new
    populate_deck
    @cards.shuffle
  end

  def populate_deck
    Card::SUITS.each do |suit|
      (2..14).each do |value|
        cards << Card.new(value, suit)
      end
    end
  end

end
