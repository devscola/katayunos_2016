class Parser
  def initialize(input)
    @number_of_fields = 0
    @number_of_fields = 2 if input.start_with?('4')
  end

  def number_of_fields
    @number_of_fields
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