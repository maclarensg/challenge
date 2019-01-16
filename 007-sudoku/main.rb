

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

def solvable(grid, i)
  # return false when we exceed metrix boundary
  return true if i > (grid.size**2 - 1)

  # return pos x,y of metrix depending on index, i 
  x, y = $pos.call(i) 

  # We only interest position of the grid that contains value
  if grid[y][x] != '.'
    # Check column
    if $col[y].has_key? grid[y][x]
      return false
    else
      $col[y][grid[y][x]] = true
    end
    # Check row
    if $row[x].has_key? grid[y][x]
      return false
    else
      $row[x][grid[y][x]] = true
    end
    # check blk
    if $blk[$find_blk.call(x, y)].has_key? grid[y][x]
      return false
    else
      $blk[$find_blk.call(x, y)][grid[y][x]] = true
    end
  end

  return solvable(grid, i+1)
end

def solve(grid, i)


  # return false when we exceed metrix boundary
  return true if i > (grid.size**2 - 1)

  x, y = $pos.call(i) 

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
  if solvable(grid, 0)
    solve(grid,0)
    pretty grid
    true
  else
    false
  end
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



p sudoku2(grid)

grid= [[".",".",".",".",".",".","5",".","."], 
        [".",".",".",".",".",".",".",".","."], 
        [".",".",".",".",".",".",".",".","."], 
        ["9","3",".",".","2",".","4",".","."], 
        [".",".","7",".",".",".","3",".","."], 
        [".",".",".",".",".",".",".",".","."], 
        [".",".",".","3","4",".",".",".","."], 
        [".",".",".",".",".","3",".",".","."], 
        [".",".",".",".",".","5","2",".","."]]