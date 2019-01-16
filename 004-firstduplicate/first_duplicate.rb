def firstDuplicate(a)
  hashmap = {}
  for i in 0...a.length
    if hashmap.has_key? a[i]
      return a[i]
    else
      hashmap[a[i]] = true
    end
  end
  -1
end


a = [2, 1, 3, 5, 3, 2]
print firstDuplicate(a)