def diamond_for(letter)
  if letter == 'A'
    "#{letter}\n"
  elsif letter == 'B'
    first_half = build_first_half_for(letter)
    gap = build_gap
    second_half = build_second_half_for(letter)

    build_diamond(first_half, gap, second_half)
  else
    "  A\n B B\n#{letter}   #{letter}\n B B\n  A\n"
  end
end

def build_first_half_for(letter)
  " A \n#{letter}"
end

def build_gap
  " "
end

def build_second_half_for(letter)
  build_first_half_for(letter).reverse
end

def build_diamond(first_half, gap, second_half)
  result = first_half + gap + second_half
  result.split("\n").map{ |l| l.rstrip }.join("\n") + "\n"
end
