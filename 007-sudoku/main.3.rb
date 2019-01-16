require 'timeout'


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
  r.each { |c| return true if r.count(pick) == 0 }
  false 
end

def check_col(grid, x, y, pick)
  r = grid.transpose[x].uniq
  r.each { |c| return true if r.count(pick) == 0 }
  false 
end


def get_combi(grid, x, y)
  row = grid[y].uniq
  column = grid.transpose[x].uniq
  r = [row, column].flatten.uniq
  r.delete(".")
  r
end

def check(grid, x, y)
  row = grid[y].uniq
  column = grid.transpose[x].uniq
  r = [row, column].flatten.uniq
  r.delete(".")
  axis_y = grid[y].clone
  axis_y.delete_at(x)
  axis_x =  grid.transpose[x].clone
  axis_x.delete_at(y)
  axis = axis_x + axis_y
  p "#{y},#{x}: #{axis}"
  r.each { |e| return false if axis.count(e) > 1}
  true
end

def range(grid)
  (1..grid.size).to_a.map(& :to_s)
end

def solve(grid, x, y)
  if grid[y][x] == '.'
    possible_values = range(grid) - get_combi(grid, x, y)
    
    return false if possible_values.length == 0
    
    possible_values.each do |value|
      grid[y][x] = value
      return true if x == grid.size-1 and y == grid.size-1 and  grid[y][x] != '.'
      if x < grid.size and y < grid.size
        xi, yi = advance_grid(grid, x, y)      
        if solve(grid, xi, yi) 
          return true
        end
      else
        return false
      end
    end
    grid[y][x]= "."
    return false
  else
    if x < grid.size and y < grid.size
      xi, yi = advance_grid(grid, x, y)
      if  solve(grid, xi, yi)
        return true
      end
    else
      return false
    end
  end
  
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
  begin
    Timeout::timeout(2) do
      return solve(grid, 0, 0)
    end
  rescue Timeout::Error
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

        grid = [[".",".",".",".",".",".",".",".","."], 
         [".",".","2",".",".",".",".",".","."], 
         [".",".",".",".",".","2","7","1","."], 
         [".",".",".",".",".",".",".",".","."], 
         [".","2",".",".",".",".",".",".","."], 
         [".","5",".",".",".",".",".",".","."], 
         [".",".",".",".","9",".",".",".","8"], 
         [".",".",".",".",".","1","6",".","."], 
         [".",".",".",".","6",".",".",".","."]]
        
grid = [['.', '.', '.', '.', '2', '.', '.', '9', '.'],
         ['.', '.', '.', '.', '6', '.', '.', '.', '.'],
         ['7', '1', '.', '.', '7', '5', '.', '.', '.'],
         ['.', '7', '.', '.', '.', '.', '.', '.', '.'],
         ['.', '.', '.', '.', '8', '3', '.', '.', '.'],
         ['.', '.', '8', '.', '.', '7', '.', '6', '.'],
         ['.', '.', '.', '.', '.', '2', '.', '.', '.'],
         ['.', '1', '.', '2', '.', '.', '.', '.', '.'],
         ['.', '2', '.', '.', '3', '.', '.', '.', '.']]
grid= [[".",".","5",".",".",".",".",".","."], 
 [".",".",".","8",".",".",".","3","."], 
 [".","5",".",".","2",".",".",".","."], 
 [".",".",".",".",".",".",".",".","."], 
 [".",".",".",".",".",".",".",".","9"], 
 [".",".",".",".",".",".","4",".","."], 
 [".",".",".",".",".",".",".",".","7"], 
 [".","1",".",".",".",".",".",".","."], 
 ["2","4",".",".",".",".","9",".","."]]
p sudoku(grid)
pretty grid

