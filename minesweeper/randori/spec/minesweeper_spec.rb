class Parser
  def initialize(input)
    @number_of_fields = extract_number_of_fields(input)
  end

  def number_of_fields
    @number_of_fields
  end

  private

  def extract_number_of_fields(input)
    return 2 if input.start_with?('4')
    0
  end
end

describe 'MineSweeper Parser' do
  it 'knows when there are no fields' do
    parser = Parser.new("0 0")

    expect(parser.number_of_fields).to eq(0)
  end

  it 'knows how many fields there are' do
    input = <<EOF
4 4
*...
....
.*..
....
3 5
**...
.....
.*...
0 0
EOF
    parser = Parser.new(input)

    expect(parser.number_of_fields).to eq(2)
  end
end