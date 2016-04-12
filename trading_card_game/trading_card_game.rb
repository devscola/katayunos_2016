class Player
  INITIAL_HEALTH = 30
  INITIAL_MANA_SLOTS = 0
  INITIAL_DECK = [0,0,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,7,8]

  def health
    INITIAL_HEALTH
  end

  def mana_slots
    INITIAL_MANA_SLOTS
  end

  def deck
    INITIAL_DECK
  end
end

def play_hand(deck, mana)
  return 0 if deck.empty?
  head, *tail = deck

  damage = 0
  damage = head if head <= mana
  damage + play_hand(tail, mana - damage)
end

