describe 'Tennis Game' do
  it 'is won by the first player that wins four balls' do
    a_player = Player.new
    another_player = Player.new
    game = Game.new(a_player, another_player)

    game.win_ball(a_player)
    game.win_ball(a_player)
    game.win_ball(a_player)
    game.win_ball(a_player)

    expect(game.winner).to eq(a_player)
  end

  it 'is not won when no player get four balls' do
    a_player = Player.new
    another_player = Player.new
    game = Game.new(a_player, another_player)

    game.win_ball(a_player)
    game.win_ball(another_player)

    expect(game.winner).to eq(:no_winner)
  end
end

class Player
end

class Score
  include Comparable

  def initialize
    @balls_won = 0
  end

  def win_ball
    @balls_won += 1
  end

  def <=>(other)
    @balls_won <=> other.balls_won
  end

  protected

  attr_reader :balls_won
end

class Deuce < Score
  def initialize
    @balls_won = 4
  end
end

class Game
  def initialize(player_a, player_b)
    @scores = {
      player_a => Score.new,
      player_b => Score.new,
      :no_winner => Deuce.new
    }
  end

  def win_ball(player)
    @scores[player].win_ball
  end

  def winner
    @scores.max { |a,b| a[1] <=> b[1] }.first
  end
end
