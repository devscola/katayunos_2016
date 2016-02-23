class Player
  def initialize
    @won_balls = 0
  end

  def score
    if @won_balls == 0
      0
    elsif @won_balls == 1
      15
    elsif @won_balls == 2
      30
    elsif @won_balls == 3
      40
    else
      "WON"
    end
  end

  def win_ball
    @won_balls += 1
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
