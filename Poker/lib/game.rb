class Game


  def receive_hand
    5.times do
      cards << deck.pop
    end
  end

  def discard(num)
    num.times do
      deck.unshift(cards.pop)
      cards.unshift(deck.pop)
    end
  end

  def fold
    cards.length.times { deck.unshift(cards.pop) }
  end

  def compare_hands(hand1, hand2)
    #if they're the same pattern
    #hand1.high_card 
  end




end
