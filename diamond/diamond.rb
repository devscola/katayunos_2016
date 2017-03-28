def diamond_for(letter)
  builder = DiamondBuilder.new(letter)
  builder.build
end

class DiamondBuilder
  NEW_LINE = "\n"

  def initialize(letter)
    @letter = letter
  end

  def build
    compose(first_half + middle_line + second_half)
  end

  private

  def compose(lines)
    remove_trailing_spaces_from(lines).join(NEW_LINE) + NEW_LINE
  end

  def first_half
    ('A'...@letter).map do |current_letter|
      build_line_for(current_letter)
    end
  end

  def middle_line
    [ build_line_for(@letter) ]
  end

  def second_half
    first_half.reverse
  end

  def build_line_for(current_letter)
    line_builder = LineBuilder.new(@letter, current_letter)
    line_builder.build
  end

  def remove_trailing_spaces_from(lines)
    lines.map{ |line| line.rstrip }
  end

  class LineBuilder
    SPACE = " "
    INITIAL_LETTER = 'A'

    def initialize(letter, current_letter)
      @letter = letter
      @current_letter = current_letter
    end

    def build
      padding + body + padding
    end

    private

    def padding
      SPACE * padding_width
    end

    def padding_width
      @letter.ord - @current_letter.ord
    end

    def gap
      SPACE * gap_width
    end

    def gap_width
      2 * (@current_letter.ord - INITIAL_LETTER.ord) - 1
    end

    def body
      return INITIAL_LETTER if edge_line?
      @current_letter + gap + @current_letter
    end

    def edge_line?
      @current_letter == INITIAL_LETTER
    end
  end
end
