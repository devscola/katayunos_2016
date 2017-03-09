require_relative '../diamond'

RSpec.describe "Diamond" do
  it "draws the minimum diamond" do
    drawing = diamond_for('A')

    expect(drawing).to eq(minimum_diamond)
  end

  it "draws the two level diamond" do
    drawing = diamond_for('B')

    expect(drawing).to eq(two_level_diamond)
  end

  def minimum_diamond
    <<~EOD
    A
    EOD
  end

  def two_level_diamond
    <<~EOD
     A
    B B
     A
    EOD
  end
end
