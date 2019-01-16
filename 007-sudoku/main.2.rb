
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


def solve(grid, x, y)
  p "#{y},#{x}"
  # when this pos need to change
  if  grid[y][x] == '.'
    # each value 
    for i in 1..grid.size
      # if value in pos does not have duplicates in x and y axis,
      if check_col(grid, x, y, i) and check_row(grid, x, y , i)
        # save  value to pos in grid
        grid[y][x] = i.to_s


        # if not bottom right of metrix, advance metrix
        if x < grid.size-1 and y < grid.size-1
          xi, yi = advance_grid(grid, x, y)
          # We see whether we can recurse on the next position in metrix and solve this puzzle
          if  solve(grid, xi, yi) 
            return true # if solved, we return true
          else 
            next # else we loop and try the next value of i
          end
        else
          # else at last pos, return false
          return false
        end
      end
      # reset the value in pos 
      grid[y][x] = '.'
    end
    # if all values tried, we really cannot solve this puzzle
    return false
  end

  # breakpoint if we fill all pos except the last pos in metrix
  return true if x == grid.size-1 and y == grid.size-1 and grid[y][x] != '.'

  # advanced next position of grid
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

grid = [['.', '.', '.', '.', '2', '.', '.', '9', '.'],
        ['.', '.', '.', '.', '6', '.', '.', '.', '.'],
        ['7', '1', '.', '.', '7', '5', '.', '.', '.'],
        ['.', '7', '.', '.', '.', '.', '.', '.', '.'],
        ['.', '.', '.', '.', '8', '3', '.', '.', '.'],
        ['.', '.', '8', '.', '.', '7', '.', '6', '.'],
        ['.', '.', '.', '.', '.', '2', '.', '.', '.'],
        ['.', '1', '.', '2', '.', '.', '.', '.', '.'],
        ['.', '2', '.', '.', '3', '.', '.', '.', '.']]

p sudoku(grid)
pretty grid