require 'colorize'

class Ocr
  Number_map = {
  '     |  |' => 1,
  ' _  _||_ ' => 2,
  ' _  _| _|' => 3,
  '   |_|  |' => 4,
  ' _ |_  _|' => 5,
  ' _ |_ |_|' => 6,
  ' _   |  |' => 7,
  ' _ |_||_|' => 8,
  ' _ |_| _|' => 9,
  ' _ | ||_|' => 0
  }

  def parse_digit(digit)
   Number_map["#{digit}"]
  end
  def read_digit(account,position)
   width = 27/9
   pos_o = position * width
   pos_e = pos_o + width
   line1 = account[pos_o..pos_e-1]
   line2 = account[pos_o+27..pos_e+26]
   line3 = account[pos_o+54..pos_e+53]
   line1<<line2<<line3
  end

  def read_account(account)
    account_vector=[]
    (0..8).to_a.each do |n|
      digit=read_digit(account,n)
      value = parse_digit(digit)
      account_vector.push(value)
    end
    account_vector
  end

  def checksum(account_vector)
    account_vector.reverse!
    acc = 0
    (0..8).to_a.each do |position|
      value = account_vector[position]
      acc += (position+1)*value
    end
    acc % 11
  end

end
