def diamond_for(letter)
  if letter == 'A'
    "#{letter}\n"
  else
    " A\n#{letter} #{letter}\n A\n"
  end
end