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
    (@score = "WON" and return) if @score == MAX_POINTS
    @score += POINTS_INCREMENT
    @score = MAX_POINTS if @score > MAX_POINTS
  end
end

describe "Tennis game" do
  subject(:player) { Player.new }

  it "initial player score" do
    expect(player.score).to eq(0)
  end

  it "player wins one ball" do
    player.win_ball
    expect(player.score).to eq(15)
  end

  it "player wins two balls" do
    2.times { player.win_ball }
    expect(player.score).to eq(30)
  end

  it "player wins three balls" do
    3.times { player.win_ball }
    expect(player.score).to eq(40)
  end

  it "player wins the game" do
    4.times { player.win_ball }
    expect(player.score).to eq("WON")
  end
end
