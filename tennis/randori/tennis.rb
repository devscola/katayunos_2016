class Player
  def initialize
    @score = 0
  end

  def score
    @score
  end

  def win_ball
    (@score = 40 and return) if @score == 30
    @score += 15
  end
end

describe "Tennis game" do
  it "initial player score" do
    player = Player.new
    player_score = player.score
    expect(player_score).to eq(0)
  end

  it "player wins one ball" do
    player = Player.new
    player.win_ball
    player_score = player.score
    expect(player_score).to eq(15)
  end

  it "player wins two balls" do
    player = Player.new
    player.win_ball
    player.win_ball
    player_score = player.score
    expect(player_score).to eq(30)
  end

  it "player wins three balls" do
    player = Player.new
    player.win_ball
    player.win_ball
    player.win_ball
    player_score = player.score
    expect(player_score).to eq(40)
  end
end
