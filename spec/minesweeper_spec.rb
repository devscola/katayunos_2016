require_relative '../minesweeper'

describe "Minesweeper" do
  it "end of input doesn't get processed" do
    input = "0 0"
    output = Minesweeper.solve(input)
    expect(output).to eq("")
  end
end
