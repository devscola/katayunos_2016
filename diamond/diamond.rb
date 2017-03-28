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
    result = first_half + middle_line + second_half
    remove_trailing_spaces_from(result) + NEW_LINE
  end

  private

  def first_half
    ('A'...@letter).map do |current_letter|
      build_line_for(current_letter)
    end.join
  end

  def middle_line
    build_line_for(@letter).chomp
  end

  def second_half
    first_half.reverse
  end

  def build_line_for(current_letter)
    padding = padding_for(current_letter)
    if current_letter == 'A'
      padding + current_letter + padding + NEW_LINE
    else
      gap = gap_for(current_letter)
      padding + current_letter + gap + current_letter + padding + NEW_LINE
    end
  end

  def gap_for(current_letter)
    gap_width = 2 * (current_letter.ord - 'A'.ord) - 1
    SPACE * gap_width
  end

  def padding_for(current_letter)
    padding_width = @letter.ord - current_letter.ord
    padding = SPACE * padding_width
  end

  def remove_trailing_spaces_from(result)
    result.split(NEW_LINE).map{ |l| l.rstrip }.join(NEW_LINE)
  end
end
