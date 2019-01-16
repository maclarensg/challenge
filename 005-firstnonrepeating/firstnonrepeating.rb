def firstNotRepeatingCharacter(s)
  hashmap = {}
  
  s.chars.each do  |c| 
    unless hashmap.has_key? c
      hashmap[c] = true
    else 
      hashmap[c] = false
    end
  end

  find = hashmap.select{ |k,v | v == true}
  unless find.empty?
    return find.keys.first
  end
  '_'
end

p firstNotRepeatingCharacter("abadcabaabaaba")