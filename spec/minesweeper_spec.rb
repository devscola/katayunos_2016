require_relative '../minesweeper'

describe "Minesweeper" do
  context "parsing the input" do
    it "end of input doesn't get processed" do
      input = "0 0"
      output = Minesweeper.solve(input)
      expect(output).to eq("")
    end
    it "doesn't allow negative dimensions" do
      input = "1 -2"
      expect { Minesweeper.solve(input) }.to raise_error Minesweeper::ParsingException
    end
  end
  it "a clean field of two" do
    input = "2 2" + "\n" +
            ".." + "\n" +
            ".." + "\n" +
            "0 0"
    output = Minesweeper.solve(input)
    expect(output).to eq("Field #1:\n00\n00\n")
  end
end
