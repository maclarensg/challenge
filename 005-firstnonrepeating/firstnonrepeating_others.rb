def firstNotRepeatingCharacter(s)
  s.chars.uniq.each { |c| return c if s.chars.count(c) == 1}
  '_'
end

p firstNotRepeatingCharacter("abacabaabaaba")