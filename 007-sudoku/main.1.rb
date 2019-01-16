
def advance_grid(grid, x, y)
  if x < grid.size - 1 
    [(x + 1), y]
  else 
    if y < grid.size - 1 
      [0, (y + 1)]
    end
  end
end

def check_row(grid, x, y, pick)
  r = grid[y].uniq
  r.each { |c| return true if r.count(pick.to_s) == 0 }
  false 
end

def check_col(grid, x, y, pick)
  r = grid.transpose[x].uniq
  r.each { |c| return true if r.count(pick.to_s) == 0 }
  false 
end

def is_x_y_within_limit(grid, x, y)
  return true if x < grid.size and y < grid.size
  false
end

def checker(grid,x,y)
  
end

def solve(grid, x, y)
  # when this pos need to change
  if  grid[y][x] == '.'
    for i in 1..grid.size
      if check_col(grid, x, y, i) and check_row(grid, x, y , i)
        grid[y][x] = i.to_s
        if x < grid.size-1 and y < grid.size-1
          xi, yi = advance_grid(grid, x, y)
          if  solve(grid, xi, yi)
            return true
          else 
            false
          end
        else
          return false
        end
      end
      grid[y][x] = '.'
    end
    return false
  end

  return true if x == grid.size-1 and y == grid.size-1 and grid[y][x] != '.'

  xi, yi = advance_grid(grid, x, y)
  return solve(grid, xi, yi)
end

def pretty(grid)
  grid.each do |y|
    y.each do |x|
      print "#{x} "
    end
    puts
  end
end

def sudoku(grid)
  solve(grid, 0, 0)
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



p sudoku(grid)
pretty grid