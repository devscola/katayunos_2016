require_relative '../diamond'

RSpec.describe "Diamond" do
  it "draws the minimum diamond" do
    drawing = diamond_for('A')

    expect(drawing).to eq(minimum_diamond)
  end

  it "draws the two letters diamond" do
    drawing = diamond_for('B')

    expect(drawing).to eq(two_letters_diamond)
  end

  it "draws the three letters diamond" do
    drawing = diamond_for('C')

    expect(drawing).to eq(three_letters_diamond)
  end

  def minimum_diamond
    <<~EOD
    A
    EOD
  end

  def two_letters_diamond
    <<~EOD
     A
    B B
     A
    EOD
  end

  def three_letters_diamond
    <<~EOD
      A
     B B
    C   C
     B B
      A
    EOD
  end
end
