require 'card'
require 'deck'
require 'hand'

describe Card do
  subject(:one_card) { Card.new(2, :diamonds) }

  describe "#initialize" do
    it "returns value and suite" do
      expect(one_card.value).to eq(2)
      expect(one_card.suit).to eq(:diamonds)
    end

    it "ensures that the value is in between 2 and 14" do

      expect {Card.new(15, :diamonds)}.to raise_error(InvalidCardError)
    end

    it "ensures that the suit is valid" do
      expect {Card.new(2, :dogs)}.to raise_error(InvalidCardError)
    end
  end

  describe "#to_s" do
    let(:face_card) { Card.new(11, :clubs)}

    it "provides a readable string output" do
      expect(one_card.to_s).to eq("2 of diamonds")
    end

    it "converts face card values to letters in string outputs" do
      expect(face_card.to_s).to eq("J of clubs")
    end
  end

end


describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "contains 52 cards" do
      expect(deck.cards.count).to eq(52)
    end

    it "contains 13 cards of each suit" do
      hearts = deck.cards.select{ |card| card.suit == :hearts }
      expect(hearts.count).to eq(13)

      clubs = deck.cards.select{ |card| card.suit == :clubs }
      expect(clubs.count).to eq(13)

      diamonds = deck.cards.select{ |card| card.suit == :diamonds }
      expect(diamonds.count).to eq(13)

      spades = deck.cards.select{ |card| card.suit == :spades }
      expect(spades.count).to eq(13)
    end

    it "contains no duplicates" do
      expect(deck.cards.uniq.length).to eq(deck.cards.length)
    end
  end
end

describe Hand do
  subject(:hand) { Hand.new(Deck.new) }

  flush_deck = Hand.new([Card.new(2, :hearts), Card.new(5, :hearts),
    Card.new(8, :hearts), Card.new(6, :hearts), Card.new(11, :hearts)])

  random_deck = Hand.new([Card.new(2, :diamonds), Card.new(5, :clubs),
    Card.new(8, :hearts), Card.new(6, :spades), Card.new(11, :hearts)])

  straight_deck = Hand.new([Card.new(3, :diamonds), Card.new(2, :clubs),
    Card.new(4, :hearts), Card.new(6, :spades), Card.new(5, :hearts)])

  straight_flush_deck = Hand.new([Card.new(3, :diamonds), Card.new(2, :diamonds),
    Card.new(4, :diamonds), Card.new(6, :diamonds), Card.new(5, :diamonds)])

  three_of_a_kind_deck = Hand.new([Card.new(2, :hearts), Card.new(2, :spades),
    Card.new(13, :diamonds), Card.new(2, :clubs), Card.new(10, :hearts)])

  full_house_deck = Hand.new([Card.new(2, :hearts), Card.new(2, :spades),
    Card.new(11, :diamonds), Card.new(11, :clubs), Card.new(11, :hearts)])

  four_of_a_kind_deck = Hand.new([Card.new(2, :hearts), Card.new(2, :spades),
    Card.new(2, :diamonds), Card.new(2, :clubs), Card.new(10, :hearts)])

  two_pair_deck = Hand.new([Card.new(2, :hearts), Card.new(7, :spades),
    Card.new(10, :diamonds), Card.new(2, :clubs), Card.new(10, :hearts)])
  # describe "#initialize" do
  #   it "has five different cards" do
  #     all_cards = hand.cards.all? { |card| card.is_a?(Card) }
  #     expect(all_cards).to be true
  #
  #     expect(hand.cards.uniq.length).to eq(5)
  #   end
  #
  # end
  #
  # describe "#discard" do
  #   let(:old_cards) { hand.cards.dup }
  #   let(:new_cards) do
  #     hand.discard(2)
  #     hand.cards
  #   end
  #
  #   it "switch some cards out for new cards from the deck" do
  #     difference = old_cards - new_cards
  #
  #     expect(difference.length).to eq(2)
  #   end
  #   #compare old_hand with new_hand
  #
  #   it "keeps five cards in the hand" do
  #     expect(new_cards.length).to eq(5)
  #   end
  # end
  #
  # describe "#fold" do
  #   it "puts the player's hand back in the deck" do
  #     before_deck_size = hand.deck.count
  #     hand.fold
  #     after_deck_size = hand.deck.count
  #
  #     expect(hand.cards.count).to eq(0)
  #     expect(after_deck_size).to eq(before_deck_size + 5)
  #   end
  #
  # end

  describe "#straight_flush?"
    it "returns true when a hand contains a straight flush" do
      expect(straight_flush_deck).to be_straight_flush
      expect(flush_deck).to_not be_straight_flush
      expect(straight_deck).to_not be_straight_flush
    end

  describe "#four_of_a_kind?"
    it "returns true when a hand contains three of a kind" do
      expect(four_of_a_kind_deck).to be_four_of_a_kind
      expect(random_deck).to_not be_four_of_a_kind
    end

  describe "#full_house?" do
    it "returns true when a hand contains a full house" do
      expect(full_house_deck).to be_full_house
      expect(random_deck).to_not be_full_house
    end
  end

  describe "#flush?" do
    it "returns true when a hand contains a flush" do
      expect(flush_deck).to be_flush
      expect(random_deck).to_not be_flush
    end
  end

  describe "#straight?" do
    it "returns true when a hand contains a straight" do
      expect(straight_deck).to be_straight
      expect(random_deck).to_not be_straight
    end
  end

  describe "#three_of_a_kind?" do
    it "returns true when a hand contains three of a kind" do
      expect(three_of_a_kind_deck).to be_three_of_a_kind
      expect(random_deck).to_not be_three_of_a_kind
    end
  end

  describe "#two_pair?" do
    it "returns true when a hand contains a two pair" do
      expect(two_pair_deck).to be_two_pair
      expect(random_deck).to_not be_two_pair
    end
  end

  describe "#one_pair?"

  describe "#high_card?"




end
