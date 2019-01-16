def rotateImage(a)
  array = []

  # Do transpose, getting the first element of each y axis by x axis. e.g. [[a,b],[c,d]] => [[a,c],[b,d]]
  for x in 0...a.first.length
    array_x = []

    # reverse the transpose seq with result in a clockwise rotation
    # e.g. [a,c] => [c,a], [b,d] => [d, b]
    (a.length - 1).downto(0).each do |y|
      array_x << a[y][x]
    end
    
    array << array_x
  end
  array
end

p rotateImage([
  [1,2,3],
  [4,5,6],
  [7,8,9]
])