class Minesweeper
  class ParsingException < StandardError
  end

  def self.solve fields
    raise ParsingException.new if fields =~ /-/
    ""
  end
end
