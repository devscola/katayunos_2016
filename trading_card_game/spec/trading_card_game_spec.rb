describe 'Trading Card Game' do
  it 'plays a card that matches the mana cost' do
    deck = [1]
    mana = 1

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(1)
  end

  it 'plays a card that inflicts maximum damage' do
    deck = [2, 1]
    mana = 1

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(1)
  end

  it 'plays as many cards as to inflict maximum damage' do
    deck = [2, 1, 1]
    mana = 3

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(3)
  end

  it 'plays as many cards as long as mana is not exceeded' do
    deck = [3, 2, 1]
    mana = 3

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(3)
  end
end

def play_hand(deck, mana)
  return 0 if deck.empty?
  head, *tail = deck

  damage = 0
  damage = head if head <= mana
  damage + play_hand(tail, mana - damage)
end