class Player
  INITIAL_HEALTH = 30
  INITIAL_MANA_SLOTS = 0

  def health
    INITIAL_HEALTH
  end

  def mana_slots
    INITIAL_MANA_SLOTS
  end
end

def play_hand(deck, mana)
  return 0 if deck.empty?
  head, *tail = deck

  damage = 0
  damage = head if head <= mana
  damage + play_hand(tail, mana - damage)
end

