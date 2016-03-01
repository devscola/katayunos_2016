class Minesweeper
  class ParsingException < StandardError
  end

  def self.solve fields
    raise ParsingException.new if fields =~ /-/
    raise ParsingException.new if fields =~ /^0 [^0]/
    ""
  end
end
