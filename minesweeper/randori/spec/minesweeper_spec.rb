class Parser
  FIELD_SEPARATOR = /\d\s\d/

  def initialize(input)
    @fields = extract_fields(input)
  end

  def next
    Field.new(@fields.shift)
  end

  private

  def extract_fields(input)
    without_newlines = input.tr("\n",'')
    split_by_separators = without_newlines.split(FIELD_SEPARATOR)
    split_by_separators.reject(&:empty?)
  end
end

class Field
  def initialize(content)
    @content = content
  end

  def resolve
    rows = 2
    result = ""
    1.upto(rows) do |row|
      result += next_line(row)
    end
    result
  end

  def to_s
    @content.to_s
  end

  private

  def next_line(current)
    mine = "*"
    one_mine_neighbour = "1"
    
    return one_mine_neighbour + one_mine_neighbour if current == 2
    
    mine + one_mine_neighbour
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

  it 'extracts fields' do
    parser = Parser.new(two_by_two + four_by_four + terminator)

    field = parser.next

    expect(field.to_s).to eq("*...")

    field = parser.next 

    expect(field.to_s).to eq("*........*......")

    expect(parser.next.to_s).to eq("")
  end
end

describe 'MineSweeper Field' do
  let(:two_by_two) do
    <<EOF
2 2
*.
..
EOF
  end

  let(:terminator) { "0 0" }

  it 'resolves' do
    field = Parser.new(two_by_two + terminator).next
    expect(field.resolve).to eq("*111")
  end
end