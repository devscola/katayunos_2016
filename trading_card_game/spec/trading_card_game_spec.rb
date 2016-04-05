describe 'Trading Card Game' do
  it 'plays a card that matches the mana cost' do
    deck = [1]
    mana = 1

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(1)
  end

  it 'plays a card that does not exceed the mana cost' do
    deck = [2, 1]
    mana = 1

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(1)
  end

  it 'plays as many cards that do not exceed the mana cost' do
    deck = [2, 1, 1]
    mana = 3

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(3)
  end
end

def play_hand(deck, mana)  
  damage = 0
  mana.times do |i|
    damage += deck.detect { |card| (mana - i) == card }.to_i
  end
  damage
end






