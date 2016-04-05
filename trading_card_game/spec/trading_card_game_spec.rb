describe 'Trading Card Game' do
  it 'plays a card that matches the mana cost' do
    deck = [1]
    mana = 1

    damage = play_hand(deck, mana)
    
    expect(damage).to eql(1)
  end

end

def play_hand(deck, mana) 
  return deck.first
end