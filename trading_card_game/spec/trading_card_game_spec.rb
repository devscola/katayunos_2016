require_relative '../trading_card_game'

describe 'Trading Card Game' do
  context "Preparation" do
    it "initial player health" do
      a_player = Player.new
      expect(a_player.health).to eq(30)
    end

    it "initial mana slots" do
      a_player = Player.new
      expect(a_player.mana_slots).to eq(0)
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

