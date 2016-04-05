describe 'Trading Card Game' do
  it 'plays a card that matches the mana cost' do
    deck = [1]
    mana = 1

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(1)
  end

  it 'plays a card that not exceds the mana cost' do
    deck = [2, 1]
    mana = 1

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(1)
  end

end

def play_hand(deck, mana)
  card_with_mana_value = deck.detect { |card| mana == card }
  card_with_mana_value
end
