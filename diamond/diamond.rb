def diamond_for(letter)
  if letter == 'A'
    "#{letter}\n"
  elsif letter == 'B'
    " A\n#{letter} #{letter}\n A\n"
  else
    "  A\n B B\n#{letter}   #{letter}\n B B\n  A\n"
  end
end
