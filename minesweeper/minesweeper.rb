class Minesweeper
  class ParsingException < StandardError
  end

  def self.solve fields
    raise ParsingException.new if invalid_input? fields
    ""
  end

  private

  def self.invalid_input? input
    input =~ /-/ || input =~ /^0 [^0]/ || input =~/^[^0] 0/
  end
end
