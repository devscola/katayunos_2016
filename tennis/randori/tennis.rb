class Player
  INITIAL_POINTS = 0
  POINTS_INCREMENT = 15
  MAX_POINTS = 40

  def initialize
    @score = INITIAL_POINTS
  end

  def score
    @score
  end

  def win_ball
    @score += POINTS_INCREMENT
    @score = MAX_POINTS if @score > MAX_POINTS
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
