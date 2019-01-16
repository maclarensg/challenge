def rotateImage(a)
  a.transpose.map(&:reverse)
end

p rotateImage([
  [1,2,3],
  [4,5,6],
  [7,8,9]
])