def CaesarCipher(str,num)
  num = num % 26 # if number get 26 was giving
  ## Need two option
  ## lowercase if ord > 122 and uppercase if ord > 90
  ## -26 if ord was greater than those two option to cycle back
cipher = str.gsub (/[a-zA-Z]/) do |c|
  if c =~/[a-z]/
    ord = c.ord + num
    ord -= 26 if ord > 122
  elsif
    c =~ /[A-Z]/
    ord = c.ord + num
    ord -= 26 if ord > 90
  end
  ord.chr
end
  cipher
end

CaesarCipher("What a string!", 5)
