def LetterChanges(str)
  str_array = str.each_byte.to_a

  buffer = ""
  str_array.each do |b|
    if ( b >= 97 && b <= 122)
      b += 1
    end

    c =  [b].pack('c')

    if (b == 97) || (b == 101) || (b == 105) || (b == 111) || (b == 117)
      c = c.upcase  
    end

    buffer += c
  end

  return buffer 
end
   
# keep this function call here    
puts LetterChanges(STDIN.gets)  

