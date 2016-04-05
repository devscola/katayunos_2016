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
  card_with_mana_value = deck.detect { |card| mana == card }
  if card_with_mana_value == nil
    first_card = deck.detect { |card| (mana - 1) == card}
    second_card = deck.detect { |card| (mana - 2) == card}
  end

  card_with_mana_value || first_card + second_card
end






