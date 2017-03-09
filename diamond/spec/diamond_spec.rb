require_relative '../diamond'

RSpec.describe "Diamond" do
  it "draws the minimum diamond" do
    drawing = diamond_for('A')

    expect(drawing).to eq(minimum_diamond)
  end

  def minimum_diamond
    <<~EOD
    A
    EOD
  end
end
