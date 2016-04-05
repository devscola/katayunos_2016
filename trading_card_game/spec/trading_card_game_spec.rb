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

  it 'plays as many cards that inflict maximum damage' do
    deck = [2, 1, 1]
    mana = 3

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(3)
  end
end

def play_hand(deck, mana)  
  return 0 if mana <= 0
  deck.detect { |card| (mana) == card }.to_i + play_hand(deck, mana - 1)
end






