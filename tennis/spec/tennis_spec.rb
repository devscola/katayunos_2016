class Score
  USUAL_SCORES = ["0", "15", "30", "40", "WON"]
  PECULIAR_SCORES = ["love", "fifteen", "thirty", "forty", "WON"]

  def initialize(scoring_system=:usual)
    @scoring_system = scoring_system
  end

  def value(won_balls)
    return PECULIAR_SCORES[won_balls] if @scoring_system == :peculiar
    USUAL_SCORES[won_balls]
  end
end

class Player
  INITIAL_WON_BALLS = 0
  WON_BALL_INCREMENT = 1

  def initialize(scoring_system)
    @won_balls = INITIAL_WON_BALLS
    @score = scoring_system
  end

  def score
    @score.value(@won_balls)
  end

  def win_ball
    @won_balls += WON_BALL_INCREMENT
  end
end

describe "Tennis game" do
  context "with the usual scoring system" do
    subject(:player) { Player.new(Score.new(:usual)) }

    it "initial player score" do
      expect(player.score).to eq("0")
    end

    it "player wins one ball" do
      player.win_ball
      expect(player.score).to eq("15")
    end

    it "player wins two balls" do
      2.times { player.win_ball }
      expect(player.score).to eq("30")
    end

    it "player wins three balls" do
      3.times { player.win_ball }
      expect(player.score).to eq("40")
    end

    it "player wins the game" do
      4.times { player.win_ball }
      expect(player.score).to eq("WON")
    end
  end

  context "with the peculiar scoring system" do
    subject(:player) { Player.new(Score.new(:peculiar)) }

    it "initial player score" do
      expect(player.score).to eq("love")
    end

    it "player wins one ball" do
      player.win_ball
      expect(player.score).to eq("fifteen")
    end

    it "player wins two balls" do
      2.times { player.win_ball }
      expect(player.score).to eq("thirty")
    end

    it "player wins three balls" do
      3.times { player.win_ball }
      expect(player.score).to eq("forty")
    end

    it "player wins the game" do
      4.times { player.win_ball }
      expect(player.score).to eq("WON")
    end
  end
end
