class Player
  def score
    0
  end
end

describe "Tennis game" do
  it "initial player score" do
    player = Player.new
    player_score = player.score
    expect(player_score).to eq(0)
  end
end
