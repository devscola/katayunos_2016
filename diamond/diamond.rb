def diamond_for(letter)
  if letter == 'A'
    "#{letter}\n"
  elsif letter == 'B'
    builder = DiamondBuilder.new(letter)

    build_diamond(builder.first_half, builder.gap, builder.second_half)
  else
    "  A\n B B\n#{letter}   #{letter}\n B B\n  A\n"
  end
end

def build_diamond(first_half, gap, second_half)
  result = first_half + gap + second_half
  result.split("\n").map{ |l| l.rstrip }.join("\n") + "\n"
end

class DiamondBuilder
  def initialize(letter)
    @letter = letter
  end

  def first_half
    " A \n#{@letter}"
  end

  def gap
    " "
  end

  def second_half
    first_half.reverse
  end
end
