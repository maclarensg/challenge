def FirstReverse(str)

  buffer=''

  (str.length-1).downto(0).each do |i|
    buffer << str[i]
  end
  # code goes here
  #return str.reverse
  return buffer
end
   
# keep this function call here 
puts "Enter string: "   
puts FirstReverse(STDIN.gets)  


  