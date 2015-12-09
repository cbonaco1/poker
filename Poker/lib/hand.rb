require_relative 'card'
require_relative 'deck'

class Hand

  PATTERNS = [:straight_flush?, :four_of_a_kind?, :full_house?, :flush?, :straight?,
    :three_of_a_kind?, :two_pair?, :one_pair?]


  attr_reader :cards
  attr_accessor :pattern, :high_card

  def initialize(cards)
    @cards = cards
    # @pattern = :none
    # @high_card =
  end

  def pattern
    return pattern
  end

  def flush?
    suits = get_suits.keys
    return true if suits.count == 1
    false
  end


  def straight?
    values = get_values.keys
    return false if values.length < 5
    values.sort!
    values[0...-1].each_with_index do |value, index|
      return false if value + 1 != values[index + 1]
    end
    true
  end

  def straight_flush?
    straight? && flush?
  end

  def three_of_a_kind?
    counts = get_values.values
    return true if counts.include?(3)
    false
  end

  def four_of_a_kind?
    counts = get_values.values
    return true if counts.include?(4)
    false
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def one_pair?
    counts = get_values.values
    return true if counts.include?(2)
    false
  end

  def two_pair?
    counts = get_values.values
    return true if counts.count(2) == 2
    false
  end


  def get_suits
    suits = Hash.new(0)
    cards.each do |card|
      suits[card.suit] += 1
    end
    suits
  end

  def get_values
    values = Hash.new(0)
    cards.each do |card|
      values[card.value] += 1
    end
    values
  end


end
