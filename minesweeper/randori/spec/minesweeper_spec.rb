class Parser
  def initialize(input)
  end

  def number_of_fields
    0
  end
end

describe 'MineSweeper Parser' do
  it 'knows when there are no fields' do
    parser = Parser.new("0 0")

    expect(parser.number_of_fields).to eq(0)
  end
end