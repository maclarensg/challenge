

# these hash validates row, col and block in sudoko
$row = 9.times.map { Hash.new }
$col = 9.times.map { Hash.new }
$blk = 9.times.map { Hash.new }

# given the value of counter n, returns the position in metrix
$pos = -> (n) { y = (n/9); x = n - (y*9); [x,y] }

# return which block depending on position
$find_blk = -> (x, y) { (y/3) * 3 + (x/3) }

def all_possible_values(grid)
  (1..grid.size).to_a.map(& :to_s)
end

def return_block(grid, x, y)
  b = []
  blk_i = $find_blk.call(x, y)

  xi = (blk_i%3)*3
  yi = (blk_i/3)*3

  3.times.each{ |i|
    3.times.each{ |j|
      b << grid[yi+i][xi+j]
    }  
  }
  return b
end

def pretty(grid)
  grid.each do |y|
    y.each do |x|
      print "#{x} "
    end
    puts
  end
end

def solve(grid, i)

  pretty grid
  puts 

  # return false when we exceed metrix boundary
  return true if i > (grid.size**2 - 1)

  x, y = $pos.call(i) 

  #p "> #{y},#{x}"
  ### check

  # select rows will filled values
  row = grid[y].select { |e| e != '.' } 
  col = grid.transpose[x].select { |e| e != '.' } 
  blk = return_block(grid, x, y).select { |e| e != '.' } 
  
  [row, col, blk].each do |array|
    if array.detect{ |e| array.count(e) > 1 }
      return false
    end
  end
  

  ### try solve
  if grid[y][x] == '.'
    registered =  [row, col, blk].flatten
    possible_values = all_possible_values(grid) - registered
    
    # try all possible value to solve
    possible_values.each do |val|
      grid[y][x] = val
      # we found solution
      if solve(grid, i+1) 
        return true 
      end
      # reset grid value before next interation or exhuast interation
      grid[y][x] = '.'
    end

    # if we exhuast all possible values no solution
    return false
  else
    return solve(grid, i+1)
  end

end

def sudoku2(grid)
  solve(grid, 0)
end


grid = [['.', '.', '.', '1', '4', '.', '.', '2', '.'],
        ['.', '.', '6', '.', '.', '.', '.', '.', '.'],
        ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
        ['.', '.', '1', '.', '.', '.', '.', '.', '.'],
        ['.', '6', '7', '.', '.', '.', '.', '.', '9'],
        ['.', '.', '.', '.', '.', '.', '8', '1', '.'],
        ['.', '3', '.', '.', '.', '.', '.', '.', '6'],
        ['.', '.', '.', '.', '.', '7', '.', '.', '.'],
        ['.', '.', '.', '5', '.', '.', '.', '7', '.']]

grid= [[".",".",".",".",".",".","5",".","."], 
        [".",".",".",".",".",".",".",".","."], 
        [".",".",".",".",".",".",".",".","."], 
        ["9","3",".",".","2",".","4",".","."], 
        [".",".","7",".",".",".","3",".","."], 
        [".",".",".",".",".",".",".",".","."], 
        [".",".",".","3","4",".",".",".","."], 
        [".",".",".",".",".","3",".",".","."], 
        [".",".",".",".",".","5","2",".","."]]
res = sudoku2(grid)
p res
if res
  pretty grid 
end

