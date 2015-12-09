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



end
