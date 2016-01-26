describe 'Bank OCR' do
  it 'parses entries with ones twos and threes' do
    entry = <<-EOF.gsub!(/^.{4}/,'')
     _  _  _  _  _  _  _  _    
     _| _| _| _| _| _| _| _|  |
     _||_  _| _| _| _| _| _|  |
    
    EOF
    
    expect(parse(entry)).to eq([323333331])
  end
  
  it 'parses entries with digits from one to nine' do
    entry = <<-EOF.gsub!(/^.{4}/,'')
        _  _     _  _  _  _  _ 
      | _| _||_||_ |_   ||_||_|
      ||_  _|  | _||_|  ||_| _|
      
    EOF

    expect(parse(entry)).to eq([123456789])
  end
  
  it 'parse entries with zero' do
    entry = <<-EOF.gsub!(/^.{4}/,'')
        _  _     _  _  _  _  _ 
      | _| _||_|| ||_   ||_||_|
      ||_  _|  ||_||_|  ||_| _|
      
    EOF

    expect(parse(entry)).to eq([123406789])
  end
  
  it 'parses multiple entries' do
    entry = <<-EOF.gsub!(/^.{4}/,'')
        _  _     _  _  _  _  _ 
      | _| _||_|| ||_   ||_||_|
      ||_  _|  ||_||_|  ||_| _|
      
        _  _     _  _  _  _  _ 
      | _| _||_||_ |_   ||_||_|
      ||_  _|  | _||_|  ||_| _|
      
      EOF

    expect(parse(entry)).to eq([123406789, 123456789])
  end
  
  def parse input
    Document.new(input).account_numbers
  end
end

class OCR
  DIGIT_STRINGS = {
    ' _ | ||_|' => 0,
    '     |  |' => 1,
    ' _  _||_ ' => 2,
    ' _  _| _|' => 3,
    '   |_|  |' => 4,
    ' _ |_  _|' => 5,
    ' _ |_ |_|' => 6,
    ' _   |  |' => 7,
    ' _ |_||_|' => 8,
    ' _ |_| _|' => 9
  }
  
  def initialize(descriptor)
    @descriptor = descriptor
  end
  
  def to_digit
    DIGIT_STRINGS[@descriptor]
  end
end

class Entry
  def initialize(descriptor)
    @descriptor = descriptor
  end
  
  def to_account_number
    parse
  end
  
  private
  
  def parse
    digits_in_account = 9
    (1..digits_in_account).
      map { |position| digit_string_in_position(position) }.join.to_i
  end

  def digit_string_in_position position
    digit_string = [
      @descriptor[0+((position-1)*3)], @descriptor[1+((position-1)*3)], @descriptor[2+((position-1)*3)],
      @descriptor[28+((position-1)*3)], @descriptor[29+((position-1)*3)], @descriptor[30+((position-1)*3)],
      @descriptor[56+((position-1)*3)], @descriptor[57+((position-1)*3)], @descriptor[58+((position-1)*3)]
    ].join
    
    OCR.new(digit_string).to_digit
  end
end

class Document
  LINE_SEPARATOR = "\n"
  LINES_PER_ENTRY = 4
  
  def initialize(descriptor)
    @descriptor = descriptor
  end
  
  def account_numbers
    account_numbers_from_descriptor
  end
  
  private
  
  def account_numbers_from_descriptor
    chunk_entry_descriptors.map do |entry_descriptor|
      Entry.new(entry_descriptor).to_account_number
    end
  end
  
  def chunk_entry_descriptors
    @descriptor.
      split(LINE_SEPARATOR).
      each_slice(LINES_PER_ENTRY).
      map { |line| line.join(LINE_SEPARATOR) }
  end
end