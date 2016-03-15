class Parser
  def initialize(input)
    @number_of_fields = extract_number_of_fields(input)
    @fields = extract_fields(input)
  end

  def number_of_fields
    @number_of_fields
  end

  def next
    @fields.first
  end

  private

  def extract_number_of_fields(input)
    input.count("1-9") / 2
  end

  def extract_fields(input)
    [input.split("\n")[1..-2].join]
  end
end

describe 'MineSweeper Parser' do
  let(:four_by_four) do
    <<EOF
4 4
*...
....
.*..
....
EOF
  end
  let(:three_by_five) do
    <<EOF
3 5
**...
.....
.*...
EOF
  end
  let(:two_by_two) do
    <<EOF
2 2
*.
..
EOF
  end
  let(:terminator) { "0 0" }

  it 'knows when there are no fields' do
    parser = Parser.new(terminator)

    expect(parser.number_of_fields).to eq(0)
  end

  it 'knows how many fields there are' do
    two_fields = four_by_four + three_by_five + terminator
    parser = Parser.new(two_fields)

    expect(parser.number_of_fields).to eq(2)

    three_fields = four_by_four + two_by_two + three_by_five + terminator
    parser = Parser.new(three_fields)

    expect(parser.number_of_fields).to eq(3)
  end

  it 'extracts fields' do
    parser = Parser.new(four_by_four + terminator)

    field = parser.next

    expect(field.to_s).to eq("*........*......")

    parser = Parser.new(two_by_two + terminator)

    field = parser.next

    expect(field.to_s).to eq("*...")
  end
end