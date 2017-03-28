def diamond_for(letter)
  builder = DiamondBuilder.new(letter)
  builder.build
end

class DiamondBuilder
  SPACE = " "
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
    padding = padding_for(current_letter)
    padding + body_for(current_letter) + padding
  end

  def body_for(current_letter)
    return current_letter if current_letter == 'A'
    gap = gap_for(current_letter)
    current_letter + gap + current_letter
  end

  def gap_for(current_letter)
    gap_width = 2 * (current_letter.ord - 'A'.ord) - 1
    SPACE * gap_width
  end

  def padding_for(current_letter)
    padding_width = @letter.ord - current_letter.ord
    padding = SPACE * padding_width
  end

  def remove_trailing_spaces_from(lines)
    lines.map{ |line| line.rstrip }
  end
end
