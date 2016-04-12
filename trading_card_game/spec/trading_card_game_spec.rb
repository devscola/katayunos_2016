require_relative '../trading_card_game'

describe 'Trading Card Game' do
  context "Preparation" do
    def a_deck(*cards)
      cards
    end

    def a_card(damage_points)
      damage_points
    end

    def a_player
      Player.new
    end

    it "initial player health" do
      player = a_player

      initial_health = player.health

      expect(initial_health).to eq(30)
    end

    it "initial mana slots" do
      player = a_player

      initial_mana_slots = player.mana_slots

      expect(initial_mana_slots).to eq(0)
    end

    it "initial deck" do
      player = a_player
      deck = a_deck(a_card(0), a_card(0), a_card(1), a_card(1), a_card(2), a_card(2), a_card(2), a_card(3), a_card(3),
a_card(3), a_card(3), a_card(4), a_card(4), a_card(4), a_card(5), a_card(5), a_card(6), a_card(6), a_card(7), a_card(8))

      initial_deck = player.deck

      expect(initial_deck).to eq(deck)
    end
  end

  context "Gameplay" do
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
end

