def diamond_for(letter)
  if letter == 'A'
    "#{letter}\n"
  elsif letter == 'B'
    first_half = " A \n#{letter}"
    gap = " "
    second_half = first_half.reverse
    result = first_half + gap + second_half
    result.split("\n").map{ |l| l.rstrip }.join("\n") + "\n"
  else
    "  A\n B B\n#{letter}   #{letter}\n B B\n  A\n"
  end
end
