def firstNotRepeatingCharacter(s)
  hashmap1 = {}
  hashmap2 = {
    1 => {},
    2 => {}
  }

  for i in 0...s.length
    if hashmap1.has_key? s[i]
      hashmap2[1].delete s[i]
    else
      hashmap1[s[i]] = true
      hashmap2[1][s[i]] = true 
    end
  end
  if not hashmap2[1].empty?
    hashmap2[1].first[0]
  else 
    '_'
  end
end

p firstNotRepeatingCharacter("abacdabaabaaba")